#line 1 "C:/Users/grego/OneDrive/Documentos/GitHub/MikroC-X-TRAINER/Practica 10/Teclado matricial/Keypad.c"
#pragma orgall 0x1FFF
#line 17 "C:/Users/grego/OneDrive/Documentos/GitHub/MikroC-X-TRAINER/Practica 10/Teclado matricial/Keypad.c"
char keypadPort at PORTB;


char getKey (void)
{
 char kp = 0;
 kp = Keypad_Key_Press();
 switch (kp)
 {
 case 1:
 return '1';
 case 2:
 return '2';
 case 3:
 return '3';
 case 4:
 return 'A';
 case 5:
 return '4';
 case 6:
 return '5';
 case 7:
 return '6';
 case 8:
 return 'B';
 case 9:
 return '7';
 case 10:
 return '8';
 case 11:
 return '9';
 case 12:
 return 'C';
 case 13:
 return '*';
 case 14:
 return '0';
 case 15:
 return '#';
 case 16:
 return 'D';
 default:
 return 0;
 }
}

void main ()org 0x2000
{
 char key;
 LATA1_bit = 0;
 TRISA1_bit = 0;
 ANSA1_bit = 0;
 Keypad_Init ();
 getKey ();

 while (1)
 {
 key = getKey ();
 if (key == '1')
 {
  LATA1_bit = 1 ;
 }

 else if (key == '0')
 {
  LATA1_bit = 0 ;
 }
 }
}
