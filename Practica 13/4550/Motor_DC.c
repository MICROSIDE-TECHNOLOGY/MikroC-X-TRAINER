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

#pragma orgall 0x1FFF                           //Espacio reservado para bootloader

#define IN_1 LATC0_bit
#define IN_2 LATC1_bit


unsigned short VELOCIDAD=0;                     //Variable para ajustar el valor del PWM1 en CCP1
unsigned short SUBE=1;


void main() org 0x2000
{
     LATC0_bit = 0;                             //Se asigna el pin como salida
     LATC1_bit = 0;                             //Se asigna el pin como salida
     TRISC0_bit = 0;                            //Se establece el pin en un estado bajo
     TRISC1_bit = 0;                            //Se establece el pin en un estado bajo
     TRISC2_bit = 0;                            // Declaramos el puerto como salida
     PWM1_Init (5000);                          // Inicializa PWM a 5000 Hz
     PWM1_Start ();

     while (1)
     {
           IN_1 = 1;                            //Dirección del motor
           IN_2 = 0 ;
           SUBE = 1;

           while (VELOCIDAD < 1020&&SUBE)
           {
                 VELOCIDAD += 5;                //Se va incrementando del valor en el PWM hasta el máximo
                 PWM1_Set_Duty  (VELOCIDAD);    //Se incrementa en pasos de 15 el ciclo de trabajo
                 delay_ms (40);
           }

           SUBE = 0;

           while (VELOCIDAD > 5&& ! SUBE)
           {
                 VELOCIDAD -= 5;                //Se va reduciendo el valor en el PWM hasta el mí­nimo
                 PWM1_Set_Duty  (VELOCIDAD);    //Se reduce en pasos de 15 el ciclo de trabajo
                 delay_ms (40) ;
           }

           SUBE = 1;
           IN_1 = 0;                            //Alto del motor
           IN_2 = 0;
           delay_ms (1000) ;

           IN_1 = 0;                            //Dirección del motor
           IN_2 = 1 ;
           SUBE = 1;

           while (VELOCIDAD < 1020&&SUBE)
           {
                 VELOCIDAD += 5;                //Se va incrementando del valor en el PWM hasta el máximo
                 PWM1_Set_Duty  (VELOCIDAD);    //Se incrementa en pasos de 15 el ciclo de trabajo
                 delay_ms (40);
           }

           SUBE = 0;

           while (VELOCIDAD > 5&& ! SUBE)
           {
                 VELOCIDAD -= 5;                //Se va reduciendo el valor en el PWM hasta el mí­nimo
                 PWM1_Set_Duty  (VELOCIDAD);    //Se reduce en pasos de 15 el ciclo de trabajo
                 delay_ms (40) ;
           }

           SUBE = 1;
           IN_1 = 0;                            //Alto del motor
           IN_2 = 0;
           delay_ms (500) ;
      }
}