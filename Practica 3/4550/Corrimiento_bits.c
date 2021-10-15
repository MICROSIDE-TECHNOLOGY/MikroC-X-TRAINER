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

#pragma orgall 0x1FFF                          //Espacio reservado para bootloader

void main() org 0x2000                         //vector de inicio usando bootloader MICROSIDE
{
    TRISB = 0x00;                              //Puerto B como salida
    PORTB = 0X0D;

    while(1){
        Delay_ms(200);                         //Espera de 200 ms
        PORTB = (PORTB << 1) | (PORTB >> 7);   //Funcion que realiza el corrimiento en las salidas digitales
    }

}