#line 1 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Blink_Led/Blink_LED_.c"
#pragma orgall 0x1FFF
#line 15 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Blink_Led/Blink_LED_.c"
void main() org 0x2000

{
 LATA1_bit = 0;
 TRISA1_bit = 0;
 ANSA1_bit = 0;

 while(1)
 {
  LATA1_bit  = 1;
 Delay_ms(1000);
  LATA1_bit  = 0;
 Delay_ms(1000);
 }
}
