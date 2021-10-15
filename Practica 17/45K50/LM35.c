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

#pragma orgall 0x1FFF                     //Espacio reservado para bootloader


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
// Fin de las referencias externas de conexión del modulo LCD

char txt[] = "Microside";
char raw_temp[15] = "";

float temperatura;


void main() org 0x2000
{
  ANSELB  = 0;                     //Configura los pines del puerto B como digitales
  C1ON_bit = 0;                    // Disable comparators
  C2ON_bit = 0;
  TRISA0_bit = 1;                  //PIN como entrada
  ANSA0_bit = 1;                   //PIN como analógico
  Lcd_Init();                      //Initializa el LCD
  Lcd_Out(1,2,txt);
  Lcd_Cmd(_LCD_CLEAR);             //Limpia el display
  Lcd_Cmd(_LCD_CURSOR_OFF);        //Posiciona el Cursor

  while(1) {    
      delay_ms(100);
      temperatura = ADC_Read(0);          //lee voltaje analogico en puerto A0
      temperatura = temperatura * 0.488;  //Da formato al valor de salida
      FloatToStr(temperatura, raw_temp);
      delay_ms(100);
      Lcd_Out(1,2,txt);
      Lcd_Out(2,2,"Temp:");
      Lcd_Chr(2,7,raw_temp[0]);
      Lcd_Chr(2,8,raw_temp[1]);
      Lcd_Chr(2,9,raw_temp[2]);
      Lcd_Chr(2,10,raw_temp[3]);
      delay_ms(100);
  }
}