#line 1 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Comunicacion_UART/SERIAL.c"
#pragma orgall 0x1FFF
#line 17 "C:/Users/grego/OneDrive/Desktop/Practicas MikroC/Practicas_MikroC/Comunicacion_UART/SERIAL.c"
void main() org 0x2000
{
 TRISB = 0x00;
 LATA1_bit = 0;
 TRISA1_bit = 0;
 ANSA1_bit = 0;
 TRISA2_bit = 1;
 ANSA2_bit = 0;
 UART1_Init(9600);
 while(1){
 if (UART_Data_Ready()) {

 char Caracter = UART_Read();

 if (Caracter == '0') {
  LATA1_bit = 0 ;
 }
 else if (Caracter == '1') {
  LATA1_bit = 1 ;
 }
 else if (Caracter == '?') {
 if ( PORTA.f2 ==1) {
 UART1_Write('0');
 } else {
 UART1_Write('1');
 }
 }
 }
 }
}
