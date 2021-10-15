/*******************************************************************************
Company:
Microside Technology Inc.

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
********************************************************************************/

/*******************************************************************************
Para usar el código con bootloader, configurar como lo indica MICROSIDE:
1) Tools> Options> Output> Output Settings> Marcar "Long HEX format"
2) Project> Edit Project> Insertar 48000000 en "MCU Clock Frequency [MHz]" box
********************************************************************************/

#pragma orgall 0x1FFF             //Espacio reservado para el bootloader


//Referencias externas de conexión del modulo LCD
sbit LCD_RS at LATB0_bit;
sbit LCD_EN at LATB2_bit;
sbit LCD_D4 at LATB3_bit;
sbit LCD_D5 at LATB4_bit;
sbit LCD_D6 at LATB5_bit;
sbit LCD_D7 at LATB6_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB6_bit;
//  Fin de las referencias externas de conexión del modulo LCD

//  18S20: 9  (Configuración por defecto; 9,10,11,o 12)
//  18B20: 12
const unsigned short TEMP_RESOLUTION = 9;

char *temp = "000.0000";
int raw_temp;

void main() org 0x2000
{
  Lcd_Init();                                //Inicializa el LCD
  Lcd_Cmd(_LCD_CLEAR);                       //Limpia el LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);                  //Posiciona el cursor
  Lcd_Out(1, 1, " Temperature:   ");

  //Imprimir carácter de grado, 'C' para grados centígrados
  Lcd_Chr(2,13,223);
  Lcd_Chr(2,14,'C');

 while(1) {

    Ow_Reset(&PORTA, 0);                     // Señal de reinicio Onewire
    Ow_Write(&PORTA, 0, 0xCC);               // Emitir comando SKIP_ROM
    Ow_Write(&PORTA, 0, 0x44);               // Emitir comando CONVERT_T

    while(Ow_Read(&PORTA, 0) == 0) ;
    Ow_Reset(&PORTA, 0);                     // Onewire reset signal
    Ow_Write(&PORTA, 0, 0xCC);               // Emitir comando SKIP_ROM
    Ow_Write(&PORTA, 0, 0xBE);               // Emitir comando READ_SCRATCHPAD

    raw_temp  = Ow_Read(&PORTA, 0);          // Read temperature LSB byte
    raw_temp |= (Ow_Read(&PORTA, 0) << 8);   // Read temperature MSB byte

    if(raw_temp & 0x8000) {                  // Si la temperatura es negativa
      temp[0] = '-';                         // coloca el signo "-"
      raw_temp = ~raw_temp + 1;              // Modifica el valor a su forma positiva
    }
    else {
      if((raw_temp >> 4) >= 100)             // Si la temperatura es >= 100 °C
        temp[0] = '1';
      else
        temp[0] = ' ';
    }

    temp[1] = ( (raw_temp >> 4) / 10 ) % 10 + 48;
    temp[2] =   (raw_temp >> 4)        % 10  + 48;

    //Da el formato con punto decimal de la temperatura
    temp[4] = ( (raw_temp & 0x0F) * 625) / 1000 + 48;
    temp[5] = (((raw_temp & 0x0F) * 625) / 100 ) % 10 + 48;
    temp[6] = (((raw_temp & 0x0F) * 625) / 10 )  % 10 + 48;
    temp[7] = ( (raw_temp & 0x0F) * 625) % 10 + 48;

    temp[8] = 223;                           //Imprime el simbolo de °
    lcd_out(2, 4, temp);                     //Muestra la temperatura en el LCD
    delay_ms(1000);                          //Espera 1 segundo
  }
}