/************************************************************************************************
Company:
Microside Technology Inc.

File Name:
PWM2.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
************************************************************************************************/

#pragma orgall 0x1FFF               //Espacio reservado para bootloader

#define LEDR LATB0_bit              // Definimos salida para  LED
#define LEDV LATB1_bit              // Definimos salida para  LED
#define LEDA LATB2_bit              // Definimos salida para  LED



void Set_PWM(void) 
{
      int i;                        // Declaramos variable
      
      for (i = 255; i > 0; i--)     // Ciclo para disminuir el valor de la variable
      {
         PWM1_Set_Duty (i);         // Guarda la salida PWM en la variable
         delay_ms (5);              // Retardo de 5ms
      }
      
      for (i = 0; i < 255; i++)     // Ciclo para aumentar el valor de la variable
      {
         PWM1_Set_Duty (i);         // Guarda la salida PWM en la variable
         delay_ms (5);              // Retardo de 5ms
      }

    }
void main() org 0x2000             // vector de inicio usando bootloader MICROSIDE
{
   LATB = 0;                       // Puerto como digital
   TRISB = 0;                      // PIN como salida
   PWM1_Init (500000);             // Inicializa PWM a 500000 Hz
   PWM1_Start ();                  // Inicia PWM

   while (1)                       // Ciclo infinito
   {      
        LEDR = 1;
        LEDA = 0;
        LEDV = 0;
        Set_PWM();                 // Convocamos la función para generar un PWM
      
        LEDR = 0;
        LEDA = 0;
        LEDV = 1;
        Set_PWM();                 // Convocamos la función para generar un PWM


        LEDA = 1;
        LEDR = 0;
        LEDV = 0;
        Set_PWM();                  // Convocamos la función para generar un PWM

   }
}