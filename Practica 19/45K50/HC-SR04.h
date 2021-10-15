/*
			HC-SR04 Library
*/

extern sfr sbit HCSR04_Trigger;
extern sfr sbit HCSR04_Echo;
extern sfr sbit HCSR04_Trigger_Direction;
extern sfr sbit HCSR04_Echo_Direction;

//factor = 1 / ( ( 4 * Prescaler ) / Clock )
extern const float factor;

void HCSR04_Init( char mode )
{
 HCSR04_Trigger_Direction = 0;
 HCSR04_Echo_Direction = 1;
 TMR1L = 0;
 TMR1H = 0;
 T1CON = 0b00000000; //Clock 4Mhz
 //T1CON = 0b00010000; //Clock 8 Mhz
 //T1CON = 0b00100000; //Clock 16 Mhz
 //T1CON = 0b00110000; //Clock 32Mhz
 T1CON.B4 = mode.B0;
 T1CON.B5 = mode.B1;
}

unsigned HCSR04_Read()
{
float distancia;
unsigned tempo;
unsigned i;
   
   HCSR04_Trigger = 0;
   Delay_us( 2 );
   HCSR04_Trigger = 1;
   Delay_us( 10 );
   HCSR04_Trigger = 0;
   
   i = 0xFFFF;
   while( !HCSR04_Echo && i-- );
   
   TMR1H = 0;
   TMR1L = 0;
   TMR1ON_Bit = 1;
   
   i = 0xFFFF;
   while( HCSR04_Echo && i-- );
   
   TMR1ON_Bit = 0;
   
   tempo = *(unsigned*)&TMR1L;
   distancia = (0.175 * tempo / factor); //distancia em mm
   
   return (unsigned)distancia;
}