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

#pragma orgall 0x1FFF                        //Espacio reservado para bootloader

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

char txt1[] = "MICROSIDE";
char txt2[] = "TECHNOLOGY";

char i;                         //variable del ciclo for

void Move_Delay() {             //Función utilizada para el movimiento del texto
  Delay_ms(500);                //Velocidad de movimiento del texto
}

void main() org 0x2000
{
  Lcd_Init();                   //Inicializa el LCD

  Lcd_Cmd(_LCD_CLEAR);          //Limpia el display
  Lcd_Cmd(_LCD_CURSOR_OFF);     //Posiciona el Cursor
  Lcd_Out(1,6,txt1);            //Escribe en la primera linea
  Lcd_Out(2,6,txt2);            //Escribe en la segunda linea
  Delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);          //limpia el display

  Lcd_Out(1,1,txt1);            //Escribe en la primera linea
  Lcd_Out(2,5,txt2);            //Escribe en la segunda linea

  Delay_ms(2000);

  for(i=0; i<4; i++) {          //Mueve el texto 4 casillas a la derecha
    Lcd_Cmd(_LCD_SHIFT_RIGHT);
    Move_Delay();
  }

  while(1) {                    //inicia el cliclo infinito
    for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Izquierda
      Lcd_Cmd(_LCD_SHIFT_LEFT);
      Move_Delay();
    }

    for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Derecha
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      Move_Delay();
    }
  }
}