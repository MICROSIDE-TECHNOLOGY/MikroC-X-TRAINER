#line 1 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Push_button/Push_Button_.c"
#pragma orgall 0x1FFF
#line 18 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Push_button/Push_Button_.c"
void main() org 0x2000
{
 LATA1_bit = 0;
 TRISA1_bit = 0;
 ANSA1_bit = 0;
 TRISA2_bit = 1;
 ANSA2_bit = 0;

 while(1)
 {
 if ( PORTA.f2 ==1) {
  LATA1_bit = 0 ;
 } else {
  LATA1_bit = 1 ;
 }
 }

}
