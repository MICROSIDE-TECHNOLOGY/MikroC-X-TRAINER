/************************************************************************************************
Company:
Microside Technology Inc.

File Name:
Push_button.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
************************************************************************************************/
#pragma orgall 0x1FFF                   //Espacio reservado para bootloader

#define LED_ON LATA1_bit = 1            //Se declara una definición que asigna el pin y su estado lógico
#define LED_OFF LATA1_bit = 0           //Se declara una definición que asigna el pin y su estado lógico
#define Boton PORTA.f2                  //Se declara una definición que devuelve el estado lógico de un pin configurado como entrada digital

void main() org 0x2000                   //Se instancia el vector de inicio usando bootloader MICROSIDE
{
  LATA1_bit = 0;                         //Escribe ceros a la salida del pin A1
  TRISA1_bit = 0;                        //Se declara como un pin de salida
  ANSA1_bit = 0;                         //Se declara como un pin digital
  TRISA2_bit = 1;                        //Se declara como un pin de entrada
  ANSA2_bit = 0;

  while(1)
  {
   if (Boton==1) {                       //Pregunta el estado del boton
      LED_OFF;                           //Apaga el LED
   } else {
      LED_ON;                            //Enciende el LED
   }
   }

}