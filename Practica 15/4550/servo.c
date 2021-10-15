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

#pragma orgall 0x1FFF

#define pin_servo LATC2_bit

void main() org 0x2000
{
     LATC2_bit = 0;         //Se asigna el pin como salida
     TRISC = 0;             //Se establece el pin en un estado bajo
     
  do
  {
    unsigned int i;
    for(i=0;i<50;i++)       //Posiciona el servomotor en 0°
    {
      pin_servo = 1;
      Delay_us(500);
      pin_servo = 0;
      Delay_us(19500);
    }
    
    Delay_ms(2000);

    for(i=0;i<50;i++)       //Posiciona el servomotor en 90°
    {
      pin_servo = 1;
      Delay_us(1500);
      pin_servo = 0;
      Delay_us(18500);
    }
    
    Delay_ms(2000);
      
    for(i=0;i<50;i++)       //Posiciona el servomotor en 180°
    {
      pin_servo = 1;
      Delay_us(2500);
      pin_servo = 0;
      Delay_us(17500);
    }
  }while(1);
}