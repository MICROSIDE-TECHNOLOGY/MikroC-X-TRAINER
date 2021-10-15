#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 14/45K50/MotorDCInfrarrojo.c"
#pragma orgall 0x1FFF
#line 18 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 14/45K50/MotorDCInfrarrojo.c"
int VALOR_ADC;

void main(void) org 0x2000
{
 TRISC = 0X00;
 PWM1_Init (5000);
 PWM1_Start ();
 TRISA0_bit = 1;
 ANSA0_bit = 1;
 ADC_Init_Advanced(_ADC_INTERNAL_REF);

 while (1)
 {
 VALOR_ADC = ADC_Get_Sample(3)*1.53;
 PWM1_Set_Duty (VALOR_ADC);
 }
}
