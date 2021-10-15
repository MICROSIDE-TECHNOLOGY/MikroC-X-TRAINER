/*******************************************************************************
Company:
Microside Technology Inc.

File Name:
Push_button.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
********************************************************************************/

/*******************************************************************************
Para usar el código con bootloader, configurar como lo indica MICROSIDE:
1) Tools> Options> Output> Output Settings> Marcar "Long HEX format"
2) Project> Edit Project> Insertar 48000000 en "MCU Clock Frequency [MHz]" box
********************************************************************************/

#pragma orgall 0x1FFF          //Espacio reservado para bootloader

#define LED_ON LATA4_bit = 1   //Se declara una definición que asigna el pin y su estado lógico
#define LED_OFF LATA4_bit = 0  //Se declara una definición que asigna el pin y su estado lógico
                               //Tome en cuenta que en versiones anteriores se hacia uso del pin A1


#define Boton PORTA.f2         //Se declara una definición que devuelve el estado lógico de un pin configurado como entrada digital

void main() org 0x2000         //Se instancia el vector de inicio usando bootloader MICROSIDE
{
  LATA4_bit = 0;               //Escribe ceros a la salida del pin A4
  TRISA4_bit = 0;              //Se declara como un pin de salida
  TRISA2_bit = 1;              //Se declara como un pin de entrada
  
  while(1)
  {
   if (Boton==1) {             //Pregunta el estado del boton
      LED_OFF;                 //Apaga el LED
   } else {
      LED_ON;                  //Enciende el LED
   }
  }

}