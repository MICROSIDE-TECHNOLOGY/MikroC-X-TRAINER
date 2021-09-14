/************************************************************************************************
Company:
Microside Technology Inc.

File Name:
SERIAL.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
************************************************************************************************/
#pragma orgall 0x1FFF                 //Espacio reservado para bootloader
#define LED_ON       LATA1_bit = 1   //Se declara una definici�n donde se asigna el pin de salida y el estado l�gico
#define LED_OFF      LATA1_bit = 0   //Se declara una definici�n donde se asigna el pin de salida y el estado l�gico
#define BOTON PORTA.f2               //Se declara una definici�n que contine la funcion que determian el estado de una estrada digital

void main() org 0x2000               //Se define el registro a partir del cual se alamcenara el codigo l�gico
{
  TRISB = 0x00;                      //Puerto B como salida
  LATA1_bit = 0;                     //Pin A1 en estado bajo
  TRISA1_bit = 0;                    //Pin A1 como salida
  ANSA1_bit = 0;                     //Pin A1 como digital
  TRISA2_bit = 1;                    //Pin A2 como salida
  ANSA2_bit = 0;                     //Pin A1 como digital
  UART1_Init(9600);                  //Se asigna la velocidad del baudrate
  while(1){
    if (UART_Data_Ready()) {         //Pregunta si ha recibido alg�n dato por el puerto serial
    
      char Caracter = UART_Read();   //Guarda el caracter
      
      if (Caracter == '0') {
        LED_OFF;                     //Apaga el LED
      }
      else if (Caracter == '1') {
        LED_ON;                      //Enciende el LED
      }
      else if (Caracter == '?') {
        if (BOTON==1) {              //Pregunta el estado del bot�n
          UART1_Write('0');          //Env�a un 0 si el bot�n no est� presionado
        } else {
          UART1_Write('1');          //Env�a un 1 si el bot�n est� presionado
        }
      }
    }
  }
}