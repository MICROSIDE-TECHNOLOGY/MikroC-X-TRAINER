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

#pragma orgall 0x1FFF                         //Espacio reservado para el bootloader

int VALOR;

void main() org 0x2000
{
      TRISB = 0x00;                           //Puerto B como salida
      VREFCON1=0XF7C;                         //Posición del registro en la memoria del pic18f45k50
      VREFCON2=0XF7B;
      VREFCON1 = 0b10100000;                  //Registro de configuración de voltajes de referencia de DAC
      
      while (1)
      {
         for (VALOR = 0; VALOR < 32; VALOR++)
         {
              VREFCON2 = VALOR;               //Valor que se carga al DAC.
              LATB = VALOR;                   //Se pasa el valor al puerto B
              delay_ms (500);                 //Retardo

         }
              delay_ms (2000);                //Retardo

         for (VALOR = 31; VALOR >= 0; VALOR--)
         {
              VREFCON2 = VALOR;               //Valor que se carga al DAC.
              LATB = VALOR;                   //Se pasa el valor al puerto B
              delay_ms (500);                 //Retardo
         }

              delay_ms (2000);                //Retardo
      }
}