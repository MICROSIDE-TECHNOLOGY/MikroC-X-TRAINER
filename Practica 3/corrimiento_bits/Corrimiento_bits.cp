#line 1 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Corrimiento_bits/Corrimiento_bits.c"
#pragma orgall 0x1FFF
#line 14 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Corrimiento_bits/Corrimiento_bits.c"
void main() org 0x2000
{
 TRISB = 0x00;
 PORTB = 0X0D;
 while(1){
 Delay_ms(200);
 PORTB = (PORTB << 1) | (PORTB >> 7);
 }

}
