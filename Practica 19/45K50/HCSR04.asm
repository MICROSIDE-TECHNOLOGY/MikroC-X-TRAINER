
_HCSR04_Init:

;hc-sr04.h,13 :: 		void HCSR04_Init( char mode )
;hc-sr04.h,15 :: 		HCSR04_Trigger_Direction = 0;
	BCF         HCSR04_Trigger_Direction+0, BitPos(HCSR04_Trigger_Direction+0) 
;hc-sr04.h,16 :: 		HCSR04_Echo_Direction = 1;
	BSF         HCSR04_Echo_Direction+0, BitPos(HCSR04_Echo_Direction+0) 
;hc-sr04.h,17 :: 		TMR1L = 0;
	CLRF        TMR1L+0 
;hc-sr04.h,18 :: 		TMR1H = 0;
	CLRF        TMR1H+0 
;hc-sr04.h,19 :: 		T1CON = 0b00000000; //Clock 4Mhz
	CLRF        T1CON+0 
;hc-sr04.h,23 :: 		T1CON.B4 = mode.B0;
	BTFSC       FARG_HCSR04_Init_mode+0, 0 
	GOTO        L__HCSR04_Init16
	BCF         T1CON+0, 4 
	GOTO        L__HCSR04_Init17
L__HCSR04_Init16:
	BSF         T1CON+0, 4 
L__HCSR04_Init17:
;hc-sr04.h,24 :: 		T1CON.B5 = mode.B1;
	BTFSC       FARG_HCSR04_Init_mode+0, 1 
	GOTO        L__HCSR04_Init18
	BCF         T1CON+0, 5 
	GOTO        L__HCSR04_Init19
L__HCSR04_Init18:
	BSF         T1CON+0, 5 
L__HCSR04_Init19:
;hc-sr04.h,25 :: 		}
L_end_HCSR04_Init:
	RETURN      0
; end of _HCSR04_Init

_HCSR04_Read:

;hc-sr04.h,27 :: 		unsigned HCSR04_Read()
;hc-sr04.h,33 :: 		HCSR04_Trigger = 0;
	BCF         HCSR04_Trigger+0, BitPos(HCSR04_Trigger+0) 
;hc-sr04.h,34 :: 		Delay_us( 2 );
	MOVLW       7
	MOVWF       R13, 0
L_HCSR04_Read0:
	DECFSZ      R13, 1, 1
	BRA         L_HCSR04_Read0
	NOP
	NOP
;hc-sr04.h,35 :: 		HCSR04_Trigger = 1;
	BSF         HCSR04_Trigger+0, BitPos(HCSR04_Trigger+0) 
;hc-sr04.h,36 :: 		Delay_us( 10 );
	MOVLW       39
	MOVWF       R13, 0
L_HCSR04_Read1:
	DECFSZ      R13, 1, 1
	BRA         L_HCSR04_Read1
	NOP
	NOP
;hc-sr04.h,37 :: 		HCSR04_Trigger = 0;
	BCF         HCSR04_Trigger+0, BitPos(HCSR04_Trigger+0) 
;hc-sr04.h,39 :: 		i = 0xFFFF;
	MOVLW       255
	MOVWF       HCSR04_Read_i_L0+0 
	MOVLW       255
	MOVWF       HCSR04_Read_i_L0+1 
;hc-sr04.h,40 :: 		while( !HCSR04_Echo && i-- );
L_HCSR04_Read2:
	BTFSC       HCSR04_Echo+0, BitPos(HCSR04_Echo+0) 
	GOTO        L_HCSR04_Read3
	MOVF        HCSR04_Read_i_L0+0, 0 
	MOVWF       R0 
	MOVF        HCSR04_Read_i_L0+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       HCSR04_Read_i_L0+0, 1 
	MOVLW       0
	SUBWFB      HCSR04_Read_i_L0+1, 1 
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_HCSR04_Read3
L__HCSR04_Read14:
	GOTO        L_HCSR04_Read2
L_HCSR04_Read3:
;hc-sr04.h,42 :: 		TMR1H = 0;
	CLRF        TMR1H+0 
;hc-sr04.h,43 :: 		TMR1L = 0;
	CLRF        TMR1L+0 
;hc-sr04.h,44 :: 		TMR1ON_Bit = 1;
	BSF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;hc-sr04.h,46 :: 		i = 0xFFFF;
	MOVLW       255
	MOVWF       HCSR04_Read_i_L0+0 
	MOVLW       255
	MOVWF       HCSR04_Read_i_L0+1 
;hc-sr04.h,47 :: 		while( HCSR04_Echo && i-- );
L_HCSR04_Read6:
	BTFSS       HCSR04_Echo+0, BitPos(HCSR04_Echo+0) 
	GOTO        L_HCSR04_Read7
	MOVF        HCSR04_Read_i_L0+0, 0 
	MOVWF       R0 
	MOVF        HCSR04_Read_i_L0+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       HCSR04_Read_i_L0+0, 1 
	MOVLW       0
	SUBWFB      HCSR04_Read_i_L0+1, 1 
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_HCSR04_Read7
L__HCSR04_Read13:
	GOTO        L_HCSR04_Read6
L_HCSR04_Read7:
;hc-sr04.h,49 :: 		TMR1ON_Bit = 0;
	BCF         TMR1ON_bit+0, BitPos(TMR1ON_bit+0) 
;hc-sr04.h,52 :: 		distancia = (0.175 * tempo / factor); //distancia em mm
	MOVF        TMR1L+0, 0 
	MOVWF       R0 
	MOVF        TMR1L+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       51
	MOVWF       R4 
	MOVLW       51
	MOVWF       R5 
	MOVLW       51
	MOVWF       R6 
	MOVLW       124
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       _factor
	MOVWF       R4 
	MOVLW       _factor+1
	MOVWF       R5 
	MOVLW       _factor+2
	MOVWF       R6 
	MOVLW       _factor+3
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
;hc-sr04.h,54 :: 		return (unsigned)distancia;
	CALL        _double2word+0, 0
;hc-sr04.h,55 :: 		}
L_end_HCSR04_Read:
	RETURN      0
; end of _HCSR04_Read

_main:

;HCSR04.c,48 :: 		void main() org 0x2000 {
;HCSR04.c,49 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;HCSR04.c,50 :: 		C1ON_bit = 0;                      // Deshabilita los comparadores
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;HCSR04.c,51 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;HCSR04.c,53 :: 		HCSR04_Init(3);                    // Conexión con el sensor HCSR04
	MOVLW       3
	MOVWF       FARG_HCSR04_Init_mode+0 
	CALL        _HCSR04_Init+0, 0
;HCSR04.c,55 :: 		Lcd_Init();                        // Inicializa el LCD
	CALL        _Lcd_Init+0, 0
;HCSR04.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);               // Limpia el LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;HCSR04.c,57 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Posiciona el cursor del LCD
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;HCSR04.c,59 :: 		while(1)
L_main10:
;HCSR04.c,61 :: 		Distancia = HCSR04_Read()/10;   //Se obtiene la lectura del sensor
	CALL        _HCSR04_Read+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _Distancia+0 
	MOVF        R1, 0 
	MOVWF       _Distancia+1 
;HCSR04.c,62 :: 		WordToStrWithZeros( Distancia, text );  //Se convierte el valor que se imprimirá en el LCD
	MOVF        R0, 0 
	MOVWF       FARG_WordToStrWithZeros_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStrWithZeros_input+1 
	MOVLW       _text+0
	MOVWF       FARG_WordToStrWithZeros_output+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_WordToStrWithZeros_output+1 
	CALL        _WordToStrWithZeros+0, 0
;HCSR04.c,63 :: 		Lcd_Out( 1, 1, "Dist.: " );
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_HCSR04+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_HCSR04+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;HCSR04.c,64 :: 		Lcd_Out_CP( text );
	MOVLW       _text+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;HCSR04.c,65 :: 		Lcd_Out_CP( "cm" );
	MOVLW       ?lstr2_HCSR04+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr2_HCSR04+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;HCSR04.c,66 :: 		Delay_ms( 300 );
	MOVLW       19
	MOVWF       R11, 0
	MOVLW       68
	MOVWF       R12, 0
	MOVLW       68
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
;HCSR04.c,67 :: 		}
	GOTO        L_main10
;HCSR04.c,69 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
