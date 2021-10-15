#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 2/Push_button/45K50/push_button.c"
#pragma orgall 0x1FFF
#line 27 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 2/Push_button/45K50/push_button.c"
void main() org 0x2000
{
 LATA4_bit = 0;
 TRISA4_bit = 0;
 TRISA2_bit = 1;
 ANSELA = 0;

 while(1)
 {
 if ( PORTA.f2 ==1) {
  LATA4_bit = 0 ;
 } else {
  LATA4_bit = 1 ;
 }
 }

}
