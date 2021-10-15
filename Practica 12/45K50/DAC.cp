#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 12/45K50/DAC.c"
#pragma orgall 0x1FFF
#line 18 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 12/45K50/DAC.c"
int VALOR;

void main() org 0x2000
{
 TRISB = 0x00;
 VREFCON1=0XF7C;
 VREFCON2=0XF7B;
 VREFCON1 = 0b10100000;

 while (1)
 {
 for (VALOR = 0; VALOR < 32; VALOR++)
 {
 VREFCON2 = VALOR;
 LATB = VALOR;
 delay_ms (500);

 }
 delay_ms (2000);

 for (VALOR = 31; VALOR >= 0; VALOR--)
 {
 VREFCON2 = VALOR;
 LATB = VALOR;
 delay_ms (500);
 }

 delay_ms (2000);
 }
}
