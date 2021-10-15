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

#pragma orgall 0x1FFF           //Espacio reservado para bootloader
#define LED LATA4_bit           //Se crea una definición donde se almacena el registro del pin
                                //Tome en cuenta que en versiones anteriores se hacia uso del pin A1

void main() org 0x2000          //Se especifica el segmento a partir de cual se almacenara el programa ya que existe un espacio
{
     LATA4_bit = 0;             //Se asigna el pin como salida
     TRISA4_bit = 0;            //Se establece el pin en un estado bajo

     while(1)
     {
             LED = 1;           //Se establece como estado alto el pin digital
             Delay_ms(1000);    //Se establece un espera de 1 segundo
             LED = 0;           //Se establece como estado bajo el pin digital
             Delay_ms(1000);    //Se establece un espera de 1 segundo
     }
}