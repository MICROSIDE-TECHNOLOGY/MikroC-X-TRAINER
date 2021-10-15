#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 19/4550/HCSR04.c"
#pragma orgall 0x1FFF
#line 1 "c:/users/grego/onedrive/desktop/mikroc_practicas/practica 19/4550/hc-sr04.h"
#line 5 "c:/users/grego/onedrive/desktop/mikroc_practicas/practica 19/4550/hc-sr04.h"
extern sfr sbit HCSR04_Trigger;
extern sfr sbit HCSR04_Echo;
extern sfr sbit HCSR04_Trigger_Direction;
extern sfr sbit HCSR04_Echo_Direction;


extern const float factor;

void HCSR04_Init( char mode )
{
 HCSR04_Trigger_Direction = 0;
 HCSR04_Echo_Direction = 1;
 TMR1L = 0;
 TMR1H = 0;
 T1CON = 0b00000000;



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
 distancia = (0.175 * tempo / factor);

 return (unsigned)distancia;
}
#line 21 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 19/4550/HCSR04.c"
sbit LCD_RS at LATB0_bit;
sbit LCD_EN at LATB2_bit;
sbit LCD_D4 at LATB3_bit;
sbit LCD_D5 at LATB4_bit;
sbit LCD_D6 at LATB5_bit;
sbit LCD_D7 at LATB6_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB6_bit;



sbit HCSR04_Trigger at RC1_Bit;
sbit HCSR04_Echo at RC0_Bit;
sbit HCSR04_Trigger_Direction at TRISC1_Bit;
sbit HCSR04_Echo_Direction at TRISC0_Bit;


char text[8];
unsigned Distancia;
const float factor = 1.5;


void main() org 0x2000 {
 ADCON1 = 0x0F;

 HCSR04_Init(3);

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1)
 {
 Distancia = HCSR04_Read()/10;
 WordToStrWithZeros( Distancia, text );
 Lcd_Out( 1, 1, "Dist.: " );
 Lcd_Out_CP( text );
 Lcd_Out_CP( "cm" );
 Delay_ms( 300 );
 }

}
