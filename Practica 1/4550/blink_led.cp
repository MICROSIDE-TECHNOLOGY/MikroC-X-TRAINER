#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 1/Blink_LED/4550/blink_led.c"
#pragma orgall 0x1FFF
#line 22 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 1/Blink_LED/4550/blink_led.c"
void main() org 0x2000
{
 LATA4_bit = 0;
 TRISA4_bit = 0;

 while(1)
 {
  LATA4_bit  = 1;
 Delay_ms(1000);
  LATA4_bit  = 0;
 Delay_ms(1000);
 }
}
