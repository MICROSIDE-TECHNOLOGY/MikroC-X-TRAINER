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

#pragma orgall 0x1FFF                       //Espacio reservado para bootloader

unsigned int ValorPOT;

void main() org 0x2000                      //vector de inicio usando bootloader MICROSIDE
{

    TRISA0_bit = 1;                         //PIN como entrada
    TRISB = 0;
    
    while (1)
    {
        ValorPOT=ADC_Read(0);               //Leer el valor del potenciometro
        
         if(ValorPot <=114)                 //Compara el valor de el ADC con 114
        {
              LATB=0b00000000;              // Leds activos
          }
            else if(ValorPot <=228)         //Compara el valor de el ADC con 228
        {
              LATB=0b00000001;              // Leds activos
          }
              else if(ValorPot <=342)       //Compara el valor de el ADC con 342
        {
              LATB=0b00000011;              // Leds activos
          }
              else if(ValorPot <=456)       //Compara el valor de el ADC con 456
        {
              LATB=0b00000111;              // Leds activos
          }
              else if(ValorPot <=570)       //Compara el valor de el ADC con 570
        {
              LATB=0b00001111;              // Leds activos
          }
               else if(ValorPot <=684)      //Compara el valor de el ADC con 684
        {
              LATB=0b00011111;              // Leds activos
          }
              else if(ValorPot <=798)       //Compara el valor de el ADC con 798
        {
              LATB=0b00111111;              // Leds activos
          }
              else if(ValorPot <=912)       //Compara el valor de el ADC con 912
        {
              LATB=0b01111111;              // Leds activos
          }
              else if(ValorPot <=1024)      //Compara el valor de el ADC con 1024
          {
              LATB=0b11111111;              // Leds activos
          }

    }
    
}