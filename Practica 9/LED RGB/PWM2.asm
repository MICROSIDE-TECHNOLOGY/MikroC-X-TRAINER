
_Set_PWM:

;PWM2.c,21 :: 		void Set_PWM(void)
;PWM2.c,25 :: 		for (i = 255; i > 0; i--)     // Ciclo para disminuir el valor de la variable
	MOVLW       255
	MOVWF       Set_PWM_i_L0+0 
	MOVLW       0
	MOVWF       Set_PWM_i_L0+1 
L_Set_PWM0:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       Set_PWM_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Set_PWM11
	MOVF        Set_PWM_i_L0+0, 0 
	SUBLW       0
L__Set_PWM11:
	BTFSC       STATUS+0, 0 
	GOTO        L_Set_PWM1
;PWM2.c,27 :: 		PWM1_Set_Duty (i);         // Guarda la salida PWM en la variable
	MOVF        Set_PWM_i_L0+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM2.c,28 :: 		delay_ms (5);              // Retardo de 5ms
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Set_PWM3:
	DECFSZ      R13, 1, 1
	BRA         L_Set_PWM3
	DECFSZ      R12, 1, 1
	BRA         L_Set_PWM3
	NOP
;PWM2.c,25 :: 		for (i = 255; i > 0; i--)     // Ciclo para disminuir el valor de la variable
	MOVLW       1
	SUBWF       Set_PWM_i_L0+0, 1 
	MOVLW       0
	SUBWFB      Set_PWM_i_L0+1, 1 
;PWM2.c,29 :: 		}
	GOTO        L_Set_PWM0
L_Set_PWM1:
;PWM2.c,31 :: 		for (i = 0; i < 255; i++)     // Ciclo para aumentar el valor de la variable
	CLRF        Set_PWM_i_L0+0 
	CLRF        Set_PWM_i_L0+1 
L_Set_PWM4:
	MOVLW       128
	XORWF       Set_PWM_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Set_PWM12
	MOVLW       255
	SUBWF       Set_PWM_i_L0+0, 0 
L__Set_PWM12:
	BTFSC       STATUS+0, 0 
	GOTO        L_Set_PWM5
;PWM2.c,33 :: 		PWM1_Set_Duty (i);         // Guarda la salida PWM en la variable
	MOVF        Set_PWM_i_L0+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PWM2.c,34 :: 		delay_ms (5);              // Retardo de 5ms
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Set_PWM7:
	DECFSZ      R13, 1, 1
	BRA         L_Set_PWM7
	DECFSZ      R12, 1, 1
	BRA         L_Set_PWM7
	NOP
;PWM2.c,31 :: 		for (i = 0; i < 255; i++)     // Ciclo para aumentar el valor de la variable
	INFSNZ      Set_PWM_i_L0+0, 1 
	INCF        Set_PWM_i_L0+1, 1 
;PWM2.c,35 :: 		}
	GOTO        L_Set_PWM4
L_Set_PWM5:
;PWM2.c,37 :: 		}
L_end_Set_PWM:
	RETURN      0
; end of _Set_PWM

_main:

;PWM2.c,38 :: 		void main() org 0x2000             // vector de inicio usando bootloader MICROSIDE
;PWM2.c,40 :: 		LATB = 0;                       // Puerto como digital
	CLRF        LATB+0 
;PWM2.c,41 :: 		TRISB = 0;                      // PIN como salida
	CLRF        TRISB+0 
;PWM2.c,42 :: 		PWM1_Init (500000);             // Inicializa PWM a 500000 Hz
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       31
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;PWM2.c,43 :: 		PWM1_Start ();                  // Inicia PWM
	CALL        _PWM1_Start+0, 0
;PWM2.c,45 :: 		while (1)                       // Ciclo infinito
L_main8:
;PWM2.c,47 :: 		LEDR = 1;
	BSF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;PWM2.c,48 :: 		LEDA = 0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;PWM2.c,49 :: 		LEDV = 0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;PWM2.c,50 :: 		Set_PWM();                 // Convocamos la función para generar un PWM
	CALL        _Set_PWM+0, 0
;PWM2.c,52 :: 		LEDR = 0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;PWM2.c,53 :: 		LEDA = 0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;PWM2.c,54 :: 		LEDV = 1;
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;PWM2.c,55 :: 		Set_PWM();                 // Convocamos la función para generar un PWM
	CALL        _Set_PWM+0, 0
;PWM2.c,58 :: 		LEDA = 1;
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;PWM2.c,59 :: 		LEDR = 0;
	BCF         LATB0_bit+0, BitPos(LATB0_bit+0) 
;PWM2.c,60 :: 		LEDV = 0;
	BCF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;PWM2.c,61 :: 		Set_PWM();                  // Convocamos la función para generar un PWM
	CALL        _Set_PWM+0, 0
;PWM2.c,63 :: 		}
	GOTO        L_main8
;PWM2.c,64 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
