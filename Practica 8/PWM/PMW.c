/************************************************************************************************
Company:
Microside Technology Inc.

File Name:
PWM.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
************************************************************************************************/

#pragma orgall 0x1FFF                 //Espacio reservado para bootloader

unsigned short i ;                    // Variable donde se guardara valores para PWM

void main() org 0x2000                //Vector de inicio usando bootloader MICROSIDE
{
   TRISC = 0X00;                      // Declaramos el puerto como salida
   PWM1_Init (5000);                  // Inicializa PWM a 5000 Hz
   PWM1_Start ();                     // Inicia PWM

   while (1)                          // Ciclo infinito
   {
      for (i = 0; i < 255; i++)       // Ciclo para aumentar el valor de la variable
      {
         PWM1_Set_Duty (i);           // Guarda la salida pwm en la variable
         delay_ms (5);                // Retardo de 5ms
      }

      for (i = 255; i > 0; i--)       // Ciclo para disminuir el valor de la variable
      {
         PWM1_Set_Duty (i);           // Guarda la salida pwm en la variable
         delay_ms (5);                // Retardo de 5ms
      }

      delay_ms (30);                  // Retardo de 30ms
   }
}