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


#pragma orgall 0x1FFF                    //Espacio reservado para bootloader
#define LED_ON       LATA4_bit = 1       //Asigna el estado de indicador visual en alto
#define LED_OFF      LATA4_bit = 0       //Asigna el estado de indicador visual en bajo
                                         //Tome en cuenta que en versiones anteriores se hacia uso del pin A1


unsigned int ValorPOT;

void main() org 0x2000                   //vector de inicio usando bootloader MICROSIDE
{
    LATA4_bit = 0;                       //SALIDA A4
    TRISA4_bit = 0;                      //PIN COMO SALIDA
    TRISA0_bit = 1;                      //PIN como entrada
    ANSA0_bit = 1;                       //PIN como analógico

    while (1)
    {
        ValorPOT=ADC_Read(0);            //Leer el valor del potenciometro

        if(ValorPot <= 512)              //Compara el valor de el ADC con 512
        {
            LED_OFF;                     //Apaga el LED
        }

        else 
        {
          LED_ON;                        //Enciende el LED
        }

    }
}