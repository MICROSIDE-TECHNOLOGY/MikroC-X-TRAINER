/************************************************************************************************
Company:
Microside Technology Inc.

File Name:
ADC SetPoint.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
************************************************************************************************/

#pragma orgall 0x1FFF                           //Espacio reservado para bootloader
#define LED_ON       LATA1_bit = 1
#define LED_OFF      LATA1_bit = 0
unsigned int ValorPOT;

void main() org 0x2000                         //vector de inicio usando bootloader MICROSIDE
{
    LATA1_bit = 0;                             //SALIDA A 0
    TRISA1_bit = 0;                            //PIN COMO SALIDA
    ANSA1_bit = 0;                             //PIN COMO DIGITAL
    TRISA3_bit = 1;                            //PIN como entrada
    ANSA3_bit = 1;                             //PIN como analógico
    
    ADC_Init_Advanced(_ADC_INTERNAL_REF);      //Voltaje de referencia a VDD y GND
    while (1)
    {
        ValorPOT=ADC_Get_Sample(3);            //Leer el valor del potenciometro

        if(ValorPot <= 512)                    //Compara el valor de el ADC con 512
        {
            LED_OFF;                           //Apaga el LED
        }

        else 
        {
          LED_ON;   //Enciende el LED
        }

    }
}