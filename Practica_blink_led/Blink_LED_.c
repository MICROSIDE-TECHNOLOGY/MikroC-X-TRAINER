/************************************************************************************************
Company:
Microside Technology Inc.

File Name:
Blink_LED.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
************************************************************************************************/
#pragma orgall 0x1FFF                           //Espacio reservado para bootloader
#define LED LATA1_bit                           //Se crea una definición donde se almacena el registro del pin

void main() org 0x2000                          //Se especifica el segmento a partir de cual se almacenara el programa ya que existe un espacio
                                                //reservado en la memoria para el bootloader de Microside
{
     LATA1_bit = 0;                             //Se asigna el pin como salida
     TRISA1_bit = 0;                            //Se establece el pin en un estado bajo
     ANSA1_bit = 0;                             //Se configura el pin como salida digital

     while(1)
     {
             LED = 1;                           //Se establece como estado alto el pin digital
             Delay_ms(1000);                    //Se establece un espera de 1 segundo
             LED = 0;                           //Se establece como estado bajo el pin digital
             Delay_ms(1000);                    //Se establece un espera de 1 segundo
     }
}