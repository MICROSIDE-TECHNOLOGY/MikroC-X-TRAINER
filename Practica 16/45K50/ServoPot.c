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

#pragma orgall 0x1FFF         //Reserva la memoria correspondiente al bootloader

int ValorPOT;
int i;

#define pin_servo LATC2_bit

void main() org 0x2000
{
   LATC2_bit = 0;                        //Se asigna el pin como salida
   TRISC = 0;                            //Se establece el pin en un estado bajo
   ANSELC = 0;
   TRISA0_bit = 1;                       //PIN como entrada
   ANSA0_bit = 1;                        //PIN como anal?gico
   
    while(1) 
    {
        ValorPOT=ADC_Read(0);            //Leer el valor del potenciometro
           
        for(i=0;i< ValorPOT + 100 ;i++)
        {
           pin_servo = 1;
           Delay_us(1);
        }


        for(i=0;i<20000 - ValorPOT;i++)
        {
           pin_servo = 0;
           Delay_us(1);
        }
         
    }

}