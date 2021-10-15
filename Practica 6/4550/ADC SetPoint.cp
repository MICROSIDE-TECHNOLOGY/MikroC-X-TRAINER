#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 6/ADC SetPoint/4550/ADC SetPoint.c"
#pragma orgall 0x1FFF
#line 24 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 6/ADC SetPoint/4550/ADC SetPoint.c"
unsigned int ValorPOT;

void main() org 0x2000
{
 LATA4_bit = 0;
 TRISA4_bit = 0;
 TRISA0_bit = 1;

 while (1)
 {
 ValorPOT=ADC_Read(0);

 if(ValorPot <= 512)
 {
  LATA4_bit = 0 ;
 }

 else
 {
  LATA4_bit = 1 ;
 }

 }
}
