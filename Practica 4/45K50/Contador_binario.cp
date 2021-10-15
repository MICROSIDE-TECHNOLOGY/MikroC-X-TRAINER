#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 4/contador_binario/45K50/Contador_binario.c"
#pragma orgall 0x1FFF
#line 16 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 4/contador_binario/45K50/Contador_binario.c"
int cont = 0;

void main() org 0x2000
{
 TRISB = 0x00;
 TRISA2_bit = 1;
 ANSA2_bit = 0;
 PORTB = 0X00;

 while(1){

 if ( PORTA.f2 ==0) {
 cont++;
 PORTB = cont;
 Delay_ms(5);
 while ( PORTA.f2 ==0);
 Delay_ms(5);
 }

 }

}
