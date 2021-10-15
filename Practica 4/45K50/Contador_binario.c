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

#pragma orgall 0x1FFF         //Espacio reservado para bootloader

#define Boton PORTA.f2        //Funcion quedetermina el estado lógico de un boton
int cont = 0;                 //Contador de proposito general

void main() org 0x2000        //vector de inicio usando bootloader MICROSIDE
{
    TRISB = 0x00;             //Puerto B como salida
    TRISA2_bit = 1;           //Pin A2 como entrada
    ANSA2_bit = 0;            //Pin A2 como entrada digital
    PORTB = 0X00;             //Puerto B en estado bajo
    
    while(1){
        
        if (Boton==0) {       //Pregunta el estado del boton
           cont++;
           PORTB = cont;      //Despliega el valor a PORTB
           Delay_ms(5);
           while (Boton==0);
           Delay_ms(5);
        }
        
    }

}