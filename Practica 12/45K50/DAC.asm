
_main:

;DAC.c,20 :: 		void main() org 0x2000
;DAC.c,22 :: 		TRISB = 0x00;                           //Puerto B como salida
	CLRF        TRISB+0 
;DAC.c,23 :: 		VREFCON1=0XF7C;                         //Posición del registro en la memoria del pic18f45k50
	MOVLW       124
	MOVWF       VREFCON1+0 
;DAC.c,24 :: 		VREFCON2=0XF7B;
	MOVLW       123
	MOVWF       VREFCON2+0 
;DAC.c,25 :: 		VREFCON1 = 0b10100000;                  //Registro de configuración de voltajes de referencia de DAC
	MOVLW       160
	MOVWF       VREFCON1+0 
;DAC.c,27 :: 		while (1)
L_main0:
;DAC.c,29 :: 		for (VALOR = 0; VALOR < 32; VALOR++)
	CLRF        _VALOR+0 
	CLRF        _VALOR+1 
L_main2:
	MOVLW       128
	XORWF       _VALOR+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVLW       32
	SUBWF       _VALOR+0, 0 
L__main13:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;DAC.c,31 :: 		VREFCON2 = VALOR;               //Valor que se carga al DAC.
	MOVF        _VALOR+0, 0 
	MOVWF       VREFCON2+0 
;DAC.c,32 :: 		LATB = VALOR;                   //Se pasa el valor al puerto B
	MOVF        _VALOR+0, 0 
	MOVWF       LATB+0 
;DAC.c,33 :: 		delay_ms (500);                 //Retardo
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;DAC.c,29 :: 		for (VALOR = 0; VALOR < 32; VALOR++)
	INFSNZ      _VALOR+0, 1 
	INCF        _VALOR+1, 1 
;DAC.c,35 :: 		}
	GOTO        L_main2
L_main3:
;DAC.c,36 :: 		delay_ms (2000);                //Retardo
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;DAC.c,38 :: 		for (VALOR = 31; VALOR >= 0; VALOR--)
	MOVLW       31
	MOVWF       _VALOR+0 
	MOVLW       0
	MOVWF       _VALOR+1 
L_main7:
	MOVLW       128
	XORWF       _VALOR+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main14
	MOVLW       0
	SUBWF       _VALOR+0, 0 
L__main14:
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
;DAC.c,40 :: 		VREFCON2 = VALOR;               //Valor que se carga al DAC.
	MOVF        _VALOR+0, 0 
	MOVWF       VREFCON2+0 
;DAC.c,41 :: 		LATB = VALOR;                   //Se pasa el valor al puerto B
	MOVF        _VALOR+0, 0 
	MOVWF       LATB+0 
;DAC.c,42 :: 		delay_ms (500);                 //Retardo
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;DAC.c,38 :: 		for (VALOR = 31; VALOR >= 0; VALOR--)
	MOVLW       1
	SUBWF       _VALOR+0, 1 
	MOVLW       0
	SUBWFB      _VALOR+1, 1 
;DAC.c,43 :: 		}
	GOTO        L_main7
L_main8:
;DAC.c,45 :: 		delay_ms (2000);                //Retardo
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
	NOP
;DAC.c,46 :: 		}
	GOTO        L_main0
;DAC.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
