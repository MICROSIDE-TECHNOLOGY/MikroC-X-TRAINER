
_main:

;DS18B20.c,42 :: 		void main() org 0x2000
;DS18B20.c,44 :: 		Lcd_Init();                                //Inicializa el LCD
	CALL        _Lcd_Init+0, 0
;DS18B20.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);                       //Limpia el LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;DS18B20.c,46 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                  //Posiciona el cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;DS18B20.c,47 :: 		Lcd_Out(1, 1, " Temperature:   ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_DS18B20+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_DS18B20+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;DS18B20.c,50 :: 		Lcd_Chr(2,13,223);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       223
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;DS18B20.c,51 :: 		Lcd_Chr(2,14,'C');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;DS18B20.c,53 :: 		while(1) {
L_main0:
;DS18B20.c,55 :: 		Ow_Reset(&PORTA, 0);                     // Señal de reinicio Onewire
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Reset_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Reset_port+1 
	CLRF        FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;DS18B20.c,56 :: 		Ow_Write(&PORTA, 0, 0xCC);               // Emitir comando SKIP_ROM
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;DS18B20.c,57 :: 		Ow_Write(&PORTA, 0, 0x44);               // Emitir comando CONVERT_T
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       68
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;DS18B20.c,59 :: 		while(Ow_Read(&PORTA, 0) == 0) ;
L_main2:
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Read_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Read_port+1 
	CLRF        FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;DS18B20.c,60 :: 		Ow_Reset(&PORTA, 0);                     // Onewire reset signal
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Reset_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Reset_port+1 
	CLRF        FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;DS18B20.c,61 :: 		Ow_Write(&PORTA, 0, 0xCC);               // Emitir comando SKIP_ROM
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;DS18B20.c,62 :: 		Ow_Write(&PORTA, 0, 0xBE);               // Emitir comando READ_SCRATCHPAD
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Write_port+1 
	CLRF        FARG_Ow_Write_pin+0 
	MOVLW       190
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;DS18B20.c,64 :: 		raw_temp  = Ow_Read(&PORTA, 0);          // Read temperature LSB byte
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Read_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Read_port+1 
	CLRF        FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _raw_temp+0 
	MOVLW       0
	MOVWF       _raw_temp+1 
;DS18B20.c,65 :: 		raw_temp |= (Ow_Read(&PORTA, 0) << 8);   // Read temperature MSB byte
	MOVLW       PORTA+0
	MOVWF       FARG_Ow_Read_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Ow_Read_port+1 
	CLRF        FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	MOVF        R0, 0 
	MOVWF       R5 
	CLRF        R4 
	MOVF        R4, 0 
	IORWF       _raw_temp+0, 0 
	MOVWF       R2 
	MOVF        _raw_temp+1, 0 
	IORWF       R5, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       _raw_temp+0 
	MOVF        R3, 0 
	MOVWF       _raw_temp+1 
;DS18B20.c,67 :: 		if(raw_temp & 0x8000) {                  // Si la temperatura es negativa
	BTFSS       R3, 7 
	GOTO        L_main4
;DS18B20.c,68 :: 		temp[0] = '-';                         // coloca el signo "-"
	MOVFF       _temp+0, FSR1L+0
	MOVFF       _temp+1, FSR1H+0
	MOVLW       45
	MOVWF       POSTINC1+0 
;DS18B20.c,69 :: 		raw_temp = ~raw_temp + 1;              // Modifica el valor a su forma positiva
	COMF        _raw_temp+0, 1 
	COMF        _raw_temp+1, 1 
	INFSNZ      _raw_temp+0, 1 
	INCF        _raw_temp+1, 1 
;DS18B20.c,70 :: 		}
	GOTO        L_main5
L_main4:
;DS18B20.c,72 :: 		if((raw_temp >> 4) >= 100)             // Si la temperatura es >= 100 °C
	MOVLW       4
	MOVWF       R0 
	MOVF        _raw_temp+0, 0 
	MOVWF       R1 
	MOVF        _raw_temp+1, 0 
	MOVWF       R2 
	MOVF        R0, 0 
L__main10:
	BZ          L__main11
	RRCF        R2, 1 
	RRCF        R1, 1 
	BCF         R2, 7 
	BTFSC       R2, 6 
	BSF         R2, 7 
	ADDLW       255
	GOTO        L__main10
L__main11:
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVLW       100
	SUBWF       R1, 0 
L__main12:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;DS18B20.c,73 :: 		temp[0] = '1';
	MOVFF       _temp+0, FSR1L+0
	MOVFF       _temp+1, FSR1H+0
	MOVLW       49
	MOVWF       POSTINC1+0 
	GOTO        L_main7
L_main6:
;DS18B20.c,75 :: 		temp[0] = ' ';
	MOVFF       _temp+0, FSR1L+0
	MOVFF       _temp+1, FSR1H+0
	MOVLW       32
	MOVWF       POSTINC1+0 
L_main7:
;DS18B20.c,76 :: 		}
L_main5:
;DS18B20.c,78 :: 		temp[1] = ( (raw_temp >> 4) / 10 ) % 10 + 48;
	MOVLW       1
	ADDWF       _temp+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       0
	ADDWFC      _temp+1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       4
	MOVWF       R2 
	MOVF        _raw_temp+0, 0 
	MOVWF       R0 
	MOVF        _raw_temp+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__main13:
	BZ          L__main14
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__main13
L__main14:
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__main+0, FSR1L+0
	MOVFF       FLOC__main+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;DS18B20.c,79 :: 		temp[2] =   (raw_temp >> 4)        % 10  + 48;
	MOVLW       2
	ADDWF       _temp+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       0
	ADDWFC      _temp+1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       4
	MOVWF       R2 
	MOVF        _raw_temp+0, 0 
	MOVWF       R0 
	MOVF        _raw_temp+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__main15:
	BZ          L__main16
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__main15
L__main16:
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__main+0, FSR1L+0
	MOVFF       FLOC__main+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;DS18B20.c,82 :: 		temp[4] = ( (raw_temp & 0x0F) * 625) / 1000 + 48;
	MOVLW       4
	ADDWF       _temp+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       0
	ADDWFC      _temp+1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       15
	ANDWF       _raw_temp+0, 0 
	MOVWF       R0 
	MOVF        _raw_temp+1, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVLW       113
	MOVWF       R4 
	MOVLW       2
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__main+0, FSR1L+0
	MOVFF       FLOC__main+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;DS18B20.c,83 :: 		temp[5] = (((raw_temp & 0x0F) * 625) / 100 ) % 10 + 48;
	MOVLW       5
	ADDWF       _temp+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       0
	ADDWFC      _temp+1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       15
	ANDWF       _raw_temp+0, 0 
	MOVWF       R0 
	MOVF        _raw_temp+1, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVLW       113
	MOVWF       R4 
	MOVLW       2
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__main+0, FSR1L+0
	MOVFF       FLOC__main+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;DS18B20.c,84 :: 		temp[6] = (((raw_temp & 0x0F) * 625) / 10 )  % 10 + 48;
	MOVLW       6
	ADDWF       _temp+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       0
	ADDWFC      _temp+1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       15
	ANDWF       _raw_temp+0, 0 
	MOVWF       R0 
	MOVF        _raw_temp+1, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVLW       113
	MOVWF       R4 
	MOVLW       2
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__main+0, FSR1L+0
	MOVFF       FLOC__main+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;DS18B20.c,85 :: 		temp[7] = ( (raw_temp & 0x0F) * 625) % 10 + 48;
	MOVLW       7
	ADDWF       _temp+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       0
	ADDWFC      _temp+1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       15
	ANDWF       _raw_temp+0, 0 
	MOVWF       R0 
	MOVF        _raw_temp+1, 0 
	MOVWF       R1 
	MOVLW       0
	ANDWF       R1, 1 
	MOVLW       113
	MOVWF       R4 
	MOVLW       2
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__main+0, FSR1L+0
	MOVFF       FLOC__main+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;DS18B20.c,87 :: 		temp[8] = 223;                           //Imprime el simbolo de °
	MOVLW       8
	ADDWF       _temp+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      _temp+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       223
	MOVWF       POSTINC1+0 
;DS18B20.c,88 :: 		lcd_out(2, 4, temp);                     //Muestra la temperatura en el LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _temp+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        _temp+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;DS18B20.c,89 :: 		delay_ms(1000);                          //Espera 1 segundo
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;DS18B20.c,90 :: 		}
	GOTO        L_main0
;DS18B20.c,91 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
