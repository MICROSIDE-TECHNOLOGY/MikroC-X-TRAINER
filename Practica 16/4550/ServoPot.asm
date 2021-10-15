
_main:

;ServoPot.c,23 :: 		void main() org 0x2000
;ServoPot.c,25 :: 		LATC2_bit = 0;                            //Se asigna el pin como salida
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;ServoPot.c,26 :: 		TRISC = 0;                                //Se establece el pin en un estado bajo
	CLRF        TRISC+0 
;ServoPot.c,27 :: 		TRISA0_bit = 1;                           //PIN como entrada
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;ServoPot.c,30 :: 		while(1)
L_main0:
;ServoPot.c,32 :: 		ValorPOT=ADC_Read(0);               //Leer el valor del potenciometro
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ValorPOT+0 
	MOVF        R1, 0 
	MOVWF       _ValorPOT+1 
;ServoPot.c,34 :: 		for(i=0;i< ValorPOT + 100 ;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
	MOVLW       100
	ADDWF       _ValorPOT+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      _ValorPOT+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main11:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;ServoPot.c,36 :: 		pin_servo = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;ServoPot.c,37 :: 		Delay_us(1);
	MOVLW       3
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	NOP
	NOP
;ServoPot.c,34 :: 		for(i=0;i< ValorPOT + 100 ;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;ServoPot.c,38 :: 		}
	GOTO        L_main2
L_main3:
;ServoPot.c,41 :: 		for(i=0;i<20000 - ValorPOT;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main6:
	MOVF        _ValorPOT+0, 0 
	SUBLW       32
	MOVWF       R1 
	MOVF        _ValorPOT+1, 0 
	MOVWF       R2 
	MOVLW       78
	SUBFWB      R2, 1 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main12
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main12:
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;ServoPot.c,43 :: 		pin_servo = 0;
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;ServoPot.c,44 :: 		Delay_us(1);
	MOVLW       3
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	NOP
	NOP
;ServoPot.c,41 :: 		for(i=0;i<20000 - ValorPOT;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;ServoPot.c,45 :: 		}
	GOTO        L_main6
L_main7:
;ServoPot.c,47 :: 		}
	GOTO        L_main0
;ServoPot.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
