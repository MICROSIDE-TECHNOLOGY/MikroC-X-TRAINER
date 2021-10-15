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

#pragma orgall 0x1FFF            //Espacio reservado para el bootloader

#include "HC-SR04.h"             //Incluir librería para el sensor HC-SR04

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
//Fin de las referencias externas de conexión del modulo LCD

//Referencias externas de conexión del modulo HCSR04
sbit HCSR04_Trigger at RC1_Bit;
sbit HCSR04_Echo at RC0_Bit;
sbit HCSR04_Trigger_Direction at TRISC1_Bit;
sbit HCSR04_Echo_Direction at TRISC0_Bit;
//Fin de las referencias externas de conexión del modulo HCSR04

char text[8];
unsigned Distancia;
const float factor = 1.5;


void main() org 0x2000 {
  ADCON1 = 0x0F;
  C1ON_bit = 0;                      // Deshabilita los comparadores
  C2ON_bit = 0;

  HCSR04_Init(3);                    // Conexión con el sensor HCSR04

  Lcd_Init();                        // Inicializa el LCD
  Lcd_Cmd(_LCD_CLEAR);               // Limpia el LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Posiciona el cursor del LCD

  while(1)
  {
     Distancia = HCSR04_Read()/10;   //Se obtiene la lectura del sensor
     WordToStrWithZeros( Distancia, text );  //Se convierte el valor que se imprimirá en el LCD
     Lcd_Out( 1, 1, "Dist.: " );
     Lcd_Out_CP( text );
     Lcd_Out_CP( "cm" );
     Delay_ms( 300 );
  }

}