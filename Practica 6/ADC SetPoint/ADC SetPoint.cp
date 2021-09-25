#line 1 "C:/Users/grego/OneDrive/Documentos/GitHub/MikroC-X-TRAINER/Practica 6/ADC SetPoint/ADC SetPoint.c"
#pragma orgall 0x1FFF
#line 16 "C:/Users/grego/OneDrive/Documentos/GitHub/MikroC-X-TRAINER/Practica 6/ADC SetPoint/ADC SetPoint.c"
unsigned int ValorPOT;

void main() org 0x2000
{
 LATA1_bit = 0;
 TRISA1_bit = 0;
 ANSA1_bit = 0;
 TRISA3_bit = 1;
 ANSA3_bit = 1;

 ADC_Init_Advanced(_ADC_INTERNAL_REF);
 while (1)
 {
 ValorPOT=ADC_Get_Sample(3);

 if(ValorPot <= 512)
 {
  LATA1_bit = 0 ;
 }

 else
 {
  LATA1_bit = 1 ;
 }

 }
}
