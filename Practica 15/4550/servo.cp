#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 15/4550/servo.c"
#pragma orgall 0x1FFF
#line 20 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 15/4550/servo.c"
void main() org 0x2000
{
 LATC2_bit = 0;
 TRISC = 0;

 do
 {
 unsigned int i;
 for(i=0;i<50;i++)
 {
  LATC2_bit  = 1;
 Delay_us(500);
  LATC2_bit  = 0;
 Delay_us(19500);
 }

 Delay_ms(2000);

 for(i=0;i<50;i++)
 {
  LATC2_bit  = 1;
 Delay_us(1500);
  LATC2_bit  = 0;
 Delay_us(18500);
 }

 Delay_ms(2000);

 for(i=0;i<50;i++)
 {
  LATC2_bit  = 1;
 Delay_us(2500);
  LATC2_bit  = 0;
 Delay_us(17500);
 }
 }while(1);
}
