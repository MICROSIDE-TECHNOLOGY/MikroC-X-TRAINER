
_main:

;Motor_DC.c,26 :: 		void main() org 0x2000
;Motor_DC.c,28 :: 		LATC0_bit = 0;                             //Se asigna el pin como salida
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;Motor_DC.c,29 :: 		LATC1_bit = 0;                             //Se asigna el pin como salida
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;Motor_DC.c,30 :: 		TRISC0_bit = 0;                            //Se establece el pin en un estado bajo
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;Motor_DC.c,31 :: 		TRISC1_bit = 0;                            //Se establece el pin en un estado bajo
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;Motor_DC.c,32 :: 		TRISC2_bit = 0;                            // Declaramos el puerto como salida
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;Motor_DC.c,33 :: 		PWM1_Init (5000);                          // Inicializa PWM a 5000 Hz
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       149
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;Motor_DC.c,34 :: 		PWM1_Start ();
	CALL        _PWM1_Start+0, 0
;Motor_DC.c,36 :: 		while (1)
L_main0:
;Motor_DC.c,38 :: 		IN_1 = 1;                            //Dirección del motor
	BSF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;Motor_DC.c,39 :: 		IN_2 = 0 ;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;Motor_DC.c,40 :: 		SUBE = 1;
	MOVLW       1
	MOVWF       _SUBE+0 
;Motor_DC.c,42 :: 		while (VELOCIDAD < 1020&&SUBE)
L_main2:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORLW       3
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	MOVLW       252
	SUBWF       _VELOCIDAD+0, 0 
L__main29:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
	MOVF        _SUBE+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
L__main27:
;Motor_DC.c,44 :: 		VELOCIDAD += 5;                //Se va incrementando del valor en el PWM hasta el máximo
	MOVLW       5
	ADDWF       _VELOCIDAD+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _VELOCIDAD+0 
;Motor_DC.c,45 :: 		PWM1_Set_Duty  (VELOCIDAD);    //Se incrementa en pasos de 15 el ciclo de trabajo
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Motor_DC.c,46 :: 		delay_ms (40);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;Motor_DC.c,47 :: 		}
	GOTO        L_main2
L_main3:
;Motor_DC.c,49 :: 		SUBE = 0;
	CLRF        _SUBE+0 
;Motor_DC.c,51 :: 		while (VELOCIDAD > 5&& ! SUBE)
L_main7:
	MOVF        _VELOCIDAD+0, 0 
	SUBLW       5
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
	MOVF        _SUBE+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main26:
;Motor_DC.c,53 :: 		VELOCIDAD -= 5;                //Se va reduciendo el valor en el PWM hasta el mí­nimo
	MOVLW       5
	SUBWF       _VELOCIDAD+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _VELOCIDAD+0 
;Motor_DC.c,54 :: 		PWM1_Set_Duty  (VELOCIDAD);    //Se reduce en pasos de 15 el ciclo de trabajo
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Motor_DC.c,55 :: 		delay_ms (40) ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;Motor_DC.c,56 :: 		}
	GOTO        L_main7
L_main8:
;Motor_DC.c,58 :: 		SUBE = 1;
	MOVLW       1
	MOVWF       _SUBE+0 
;Motor_DC.c,59 :: 		IN_1 = 0;                            //Alto del motor
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;Motor_DC.c,60 :: 		IN_2 = 0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;Motor_DC.c,61 :: 		delay_ms (1000) ;
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;Motor_DC.c,63 :: 		IN_1 = 0;                            //Dirección del motor
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;Motor_DC.c,64 :: 		IN_2 = 1 ;
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;Motor_DC.c,65 :: 		SUBE = 1;
	MOVLW       1
	MOVWF       _SUBE+0 
;Motor_DC.c,67 :: 		while (VELOCIDAD < 1020&&SUBE)
L_main13:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORLW       3
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main30
	MOVLW       252
	SUBWF       _VELOCIDAD+0, 0 
L__main30:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
	MOVF        _SUBE+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
L__main25:
;Motor_DC.c,69 :: 		VELOCIDAD += 5;                //Se va incrementando del valor en el PWM hasta el máximo
	MOVLW       5
	ADDWF       _VELOCIDAD+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _VELOCIDAD+0 
;Motor_DC.c,70 :: 		PWM1_Set_Duty  (VELOCIDAD);    //Se incrementa en pasos de 15 el ciclo de trabajo
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Motor_DC.c,71 :: 		delay_ms (40);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
;Motor_DC.c,72 :: 		}
	GOTO        L_main13
L_main14:
;Motor_DC.c,74 :: 		SUBE = 0;
	CLRF        _SUBE+0 
;Motor_DC.c,76 :: 		while (VELOCIDAD > 5&& ! SUBE)
L_main18:
	MOVF        _VELOCIDAD+0, 0 
	SUBLW       5
	BTFSC       STATUS+0, 0 
	GOTO        L_main19
	MOVF        _SUBE+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
L__main24:
;Motor_DC.c,78 :: 		VELOCIDAD -= 5;                //Se va reduciendo el valor en el PWM hasta el mí­nimo
	MOVLW       5
	SUBWF       _VELOCIDAD+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _VELOCIDAD+0 
;Motor_DC.c,79 :: 		PWM1_Set_Duty  (VELOCIDAD);    //Se reduce en pasos de 15 el ciclo de trabajo
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;Motor_DC.c,80 :: 		delay_ms (40) ;
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
;Motor_DC.c,81 :: 		}
	GOTO        L_main18
L_main19:
;Motor_DC.c,83 :: 		SUBE = 1;
	MOVLW       1
	MOVWF       _SUBE+0 
;Motor_DC.c,84 :: 		IN_1 = 0;                            //Alto del motor
	BCF         LATC0_bit+0, BitPos(LATC0_bit+0) 
;Motor_DC.c,85 :: 		IN_2 = 0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;Motor_DC.c,86 :: 		delay_ms (500) ;
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
;Motor_DC.c,87 :: 		}
	GOTO        L_main0
;Motor_DC.c,88 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
