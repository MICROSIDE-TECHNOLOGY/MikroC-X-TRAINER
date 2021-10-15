
_main:

;servo.c,20 :: 		void main() org 0x2000
;servo.c,22 :: 		LATC2_bit = 0;         //Se asigna el pin como salida
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;servo.c,23 :: 		TRISC = 0;             //Se establece el pin en un estado bajo
	CLRF        TRISC+0 
;servo.c,25 :: 		do
L_main0:
;servo.c,28 :: 		for(i=0;i<50;i++)       //Posiciona el servomotor en 0°
	CLRF        R1 
	CLRF        R2 
L_main3:
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       50
	SUBWF       R1, 0 
L__main21:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;servo.c,30 :: 		pin_servo = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;servo.c,31 :: 		Delay_us(500);
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;servo.c,32 :: 		pin_servo = 0;
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;servo.c,33 :: 		Delay_us(19500);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       48
	MOVWF       R12, 0
	MOVLW       226
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;servo.c,28 :: 		for(i=0;i<50;i++)       //Posiciona el servomotor en 0°
	INFSNZ      R1, 1 
	INCF        R2, 1 
;servo.c,34 :: 		}
	GOTO        L_main3
L_main4:
;servo.c,36 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
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
;servo.c,38 :: 		for(i=0;i<50;i++)       //Posiciona el servomotor en 90°
	CLRF        R1 
	CLRF        R2 
L_main9:
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVLW       50
	SUBWF       R1, 0 
L__main22:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
;servo.c,40 :: 		pin_servo = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;servo.c,41 :: 		Delay_us(1500);
	MOVLW       24
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
;servo.c,42 :: 		pin_servo = 0;
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;servo.c,43 :: 		Delay_us(18500);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       76
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
;servo.c,38 :: 		for(i=0;i<50;i++)       //Posiciona el servomotor en 90°
	INFSNZ      R1, 1 
	INCF        R2, 1 
;servo.c,44 :: 		}
	GOTO        L_main9
L_main10:
;servo.c,46 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
	NOP
;servo.c,48 :: 		for(i=0;i<50;i++)       //Posiciona el servomotor en 180°
	CLRF        R1 
	CLRF        R2 
L_main15:
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVLW       50
	SUBWF       R1, 0 
L__main23:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
;servo.c,50 :: 		pin_servo = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;servo.c,51 :: 		Delay_us(2500);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
;servo.c,52 :: 		pin_servo = 0;
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;servo.c,53 :: 		Delay_us(17500);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       17
	MOVWF       R12, 0
	MOVLW       183
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
;servo.c,48 :: 		for(i=0;i<50;i++)       //Posiciona el servomotor en 180°
	INFSNZ      R1, 1 
	INCF        R2, 1 
;servo.c,54 :: 		}
	GOTO        L_main15
L_main16:
;servo.c,55 :: 		}while(1);
	GOTO        L_main0
;servo.c,56 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
