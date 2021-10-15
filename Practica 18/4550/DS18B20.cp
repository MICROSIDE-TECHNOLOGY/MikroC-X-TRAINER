#line 1 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 18/4550/DS18B20.c"
#pragma orgall 0x1FFF
#line 20 "C:/Users/grego/OneDrive/Desktop/MikroC_Practicas/Practica 18/4550/DS18B20.c"
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




const unsigned short TEMP_RESOLUTION = 9;

char *temp = "000.0000";
int raw_temp;

void main() org 0x2000
{
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, " Temperature:   ");


 Lcd_Chr(2,13,223);
 Lcd_Chr(2,14,'C');

 while(1) {

 Ow_Reset(&PORTA, 0);
 Ow_Write(&PORTA, 0, 0xCC);
 Ow_Write(&PORTA, 0, 0x44);

 while(Ow_Read(&PORTA, 0) == 0) ;
 Ow_Reset(&PORTA, 0);
 Ow_Write(&PORTA, 0, 0xCC);
 Ow_Write(&PORTA, 0, 0xBE);

 raw_temp = Ow_Read(&PORTA, 0);
 raw_temp |= (Ow_Read(&PORTA, 0) << 8);

 if(raw_temp & 0x8000) {
 temp[0] = '-';
 raw_temp = ~raw_temp + 1;
 }
 else {
 if((raw_temp >> 4) >= 100)
 temp[0] = '1';
 else
 temp[0] = ' ';
 }

 temp[1] = ( (raw_temp >> 4) / 10 ) % 10 + 48;
 temp[2] = (raw_temp >> 4) % 10 + 48;


 temp[4] = ( (raw_temp & 0x0F) * 625) / 1000 + 48;
 temp[5] = (((raw_temp & 0x0F) * 625) / 100 ) % 10 + 48;
 temp[6] = (((raw_temp & 0x0F) * 625) / 10 ) % 10 + 48;
 temp[7] = ( (raw_temp & 0x0F) * 625) % 10 + 48;

 temp[8] = 223;
 lcd_out(2, 4, temp);
 delay_ms(1000);
 }
}
