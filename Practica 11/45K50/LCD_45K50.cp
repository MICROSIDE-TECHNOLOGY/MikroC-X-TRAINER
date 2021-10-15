#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 11/45K50/LCD_45K50.c"
#pragma orgall 0x1FFF
#line 19 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 11/45K50/LCD_45K50.c"
sbit LCD_RS at LATB0_bit;
sbit LCD_EN at LATB2_bit;
sbit LCD_D4 at LATB3_bit;
sbit LCD_D5 at LATB4_bit;
sbit LCD_D6 at LATB5_bit;
sbit LCD_D7 at LATB6_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB6_bit;


char txt1[] = "MICROSIDE";
char txt2[] = "TECHNOLOGY";

char i;

void Move_Delay() {
 Delay_ms(500);
}

void main() org 0x2000
{
 ANSELB = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 TRISA0_bit = 1;
 ANSA0_bit = 1;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,6,txt1);
 Lcd_Out(2,6,txt2);
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,txt1);
 Lcd_Out(2,5,txt2);

 Delay_ms(2000);

 for(i=0; i<4; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }

 while(1) {
 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Move_Delay();
 }

 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }
 }
}
