#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 13/45K50/Motor_DC.c"
#pragma orgall 0x1FFF
#line 22 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 13/45K50/Motor_DC.c"
unsigned short VELOCIDAD=0;
unsigned short SUBE=1;


void main() org 0x2000
{
 LATC0_bit = 0;
 LATC1_bit = 0;
 TRISC0_bit = 0;
 TRISC1_bit = 0;
 TRISC2_bit = 0;
 ANSELC = 0;
 PWM1_Init (5000);
 PWM1_Start ();

 while (1)
 {
  LATC0_bit  = 1;
  LATC1_bit  = 0 ;
 SUBE = 1;

 while (VELOCIDAD < 1020&&SUBE)
 {
 VELOCIDAD += 5;
 PWM1_Set_Duty (VELOCIDAD);
 delay_ms (40);
 }

 SUBE = 0;

 while (VELOCIDAD > 5&& ! SUBE)
 {
 VELOCIDAD -= 5;
 PWM1_Set_Duty (VELOCIDAD);
 delay_ms (40) ;
 }

 SUBE = 1;
  LATC0_bit  = 0;
  LATC1_bit  = 0;
 delay_ms (1000) ;

  LATC0_bit  = 0;
  LATC1_bit  = 1 ;
 SUBE = 1;

 while (VELOCIDAD < 1020&&SUBE)
 {
 VELOCIDAD += 5;
 PWM1_Set_Duty (VELOCIDAD);
 delay_ms (40);
 }

 SUBE = 0;

 while (VELOCIDAD > 5&& ! SUBE)
 {
 VELOCIDAD -= 5;
 PWM1_Set_Duty (VELOCIDAD);
 delay_ms (40) ;
 }

 SUBE = 1;
  LATC0_bit  = 0;
  LATC1_bit  = 0;
 delay_ms (500) ;
 }
}
