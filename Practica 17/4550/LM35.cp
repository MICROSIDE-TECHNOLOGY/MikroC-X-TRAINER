#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 17/4550/LM35.c"
#pragma orgall 0x1FFF
#line 20 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 17/4550/LM35.c"
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


char txt[] = "Microside";
char raw_temp[15] = "";

float temperatura;


void main() org 0x2000
{
 TRISA0_bit = 1;
 Lcd_Init();
 Lcd_Out(1,2,txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while(1) {
 delay_ms(100);
 temperatura = ADC_Read(0);
 temperatura = temperatura * 0.488;
 FloatToStr(temperatura, raw_temp);
 delay_ms(100);
 Lcd_Out(1,2,txt);
 Lcd_Out(2,2,"Temp:");
 Lcd_Chr(2,7,raw_temp[0]);
 Lcd_Chr(2,8,raw_temp[1]);
 Lcd_Chr(2,9,raw_temp[2]);
 Lcd_Chr(2,10,raw_temp[3]);
 delay_ms(100);
 }
}
