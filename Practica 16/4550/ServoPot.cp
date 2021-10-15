#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 16/4550/ServoPot.c"
#pragma orgall 0x1FFF
#line 18 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 16/4550/ServoPot.c"
int ValorPOT;
int i;



void main() org 0x2000
{
 LATC2_bit = 0;
 TRISC = 0;
 TRISA0_bit = 1;


 while(1)
 {
 ValorPOT=ADC_Read(0);

 for(i=0;i< ValorPOT + 100 ;i++)
 {
  LATC2_bit  = 1;
 Delay_us(1);
 }


 for(i=0;i<20000 - ValorPOT;i++)
 {
  LATC2_bit  = 0;
 Delay_us(1);
 }

 }

}
