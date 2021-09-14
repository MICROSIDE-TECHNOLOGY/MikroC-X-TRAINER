#line 1 "C:/Users/grego/Downloads/Práctica-5-PIC-BOOT/Proyecto/ADC.c"
#pragma orgall 0x1FFF
#line 15 "C:/Users/grego/Downloads/Práctica-5-PIC-BOOT/Proyecto/ADC.c"
unsigned int ValorPOT;

void main() org 0x2000
{
 TRISB = 0x00;
 TRISA0_bit = 1;
 ANSA0_bit = 1;
 ADC_Init_Advanced(_ADC_INTERNAL_REF);
 while (1)
 {
 ValorPOT=ADC_Get_Sample(3);

 if(ValorPot <=114)
 {
 LATB=0b00000000;
 }
 else if(ValorPot <=228)
 {
 LATB=0b00000001;
 }
 else if(ValorPot <=342)
 {
 LATB=0b00000011;
 }
 else if(ValorPot <=456)
 {
 LATB=0b00000111;
 }
 else if(ValorPot <=570)
 {
 LATB=0b00001111;
 }
 else if(ValorPot <=684)
 {
 LATB=0b00011111;
 }
 else if(ValorPot <=798)
 {
 LATB=0b00111111;
 }
 else if(ValorPot <=912)
 {
 LATB=0b01111111;
 }
 else if(ValorPot <=1024)
 {
 LATB=0b11111111;
 }

 }

}
