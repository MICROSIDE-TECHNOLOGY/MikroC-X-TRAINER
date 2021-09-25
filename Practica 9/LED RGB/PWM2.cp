#line 1 "C:/Users/grego/OneDrive/Documentos/GitHub/MikroC-X-TRAINER/Practica 9/LED RGB/PWM2.c"
#pragma orgall 0x1FFF
#line 21 "C:/Users/grego/OneDrive/Documentos/GitHub/MikroC-X-TRAINER/Practica 9/LED RGB/PWM2.c"
void Set_PWM(void)
{
 int i;

 for (i = 255; i > 0; i--)
 {
 PWM1_Set_Duty (i);
 delay_ms (5);
 }

 for (i = 0; i < 255; i++)
 {
 PWM1_Set_Duty (i);
 delay_ms (5);
 }

 }
void main() org 0x2000
{
 LATB = 0;
 TRISB = 0;
 PWM1_Init (500000);
 PWM1_Start ();

 while (1)
 {
  LATB0_bit  = 1;
  LATB2_bit  = 0;
  LATB1_bit  = 0;
 Set_PWM();

  LATB0_bit  = 0;
  LATB2_bit  = 0;
  LATB1_bit  = 1;
 Set_PWM();


  LATB2_bit  = 1;
  LATB0_bit  = 0;
  LATB1_bit  = 0;
 Set_PWM();

 }
}
