/************************************************************************************************
Company:
Microside Technology Inc.

File Name:
Corrimiento_bits.mcppi

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
************************************************************************************************/
#pragma orgall 0x1FFF         //Espacio reservado para bootloader

void main() org 0x2000                         //vector de inicio usando bootloader MICROSIDE
{
    TRISB = 0x00;                              //Puerto B como salida
    PORTB = 0X0D;
    while(1){
        Delay_ms(200);                        //Espera de 200 ms
        PORTB = (PORTB << 1) | (PORTB >> 7);  //Funcion que realiza el corrimiento en las salidas digitales
    }

}