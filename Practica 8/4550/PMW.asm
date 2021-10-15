
_main:

;PMW.c,23 :: 		void main() org 0x2000                //Vector de inicio usando bootloader MICROSIDE
;PMW.c,25 :: 		TRISC = 0X00;                      // Declaramos el puerto como salida
	CLRF        TRISC+0 
;PMW.c,26 :: 		PWM1_Init (5000);                  // Inicializa PWM a 5000 Hz
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       149
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;PMW.c,27 :: 		PWM1_Start ();                     // Inicia PWM
	CALL        _PWM1_Start+0, 0
;PMW.c,29 :: 		while (1)                          // Ciclo infinito
L_main0:
;PMW.c,31 :: 		for (i = 0; i < 255; i++)       // Ciclo para aumentar el valor de la variable
	CLRF        _i+0 
L_main2:
	MOVLW       255
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;PMW.c,33 :: 		PWM1_Set_Duty (i);           // Guarda la salida pwm en la variable
	MOVF        _i+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PMW.c,34 :: 		delay_ms (5);                // Retardo de 5ms
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
;PMW.c,31 :: 		for (i = 0; i < 255; i++)       // Ciclo para aumentar el valor de la variable
	INCF        _i+0, 1 
;PMW.c,35 :: 		}
	GOTO        L_main2
L_main3:
;PMW.c,37 :: 		for (i = 255; i > 0; i--)       // Ciclo para disminuir el valor de la variable
	MOVLW       255
	MOVWF       _i+0 
L_main6:
	MOVF        _i+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;PMW.c,39 :: 		PWM1_Set_Duty (i);           // Guarda la salida pwm en la variable
	MOVF        _i+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;PMW.c,40 :: 		delay_ms (5);                // Retardo de 5ms
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
;PMW.c,37 :: 		for (i = 255; i > 0; i--)       // Ciclo para disminuir el valor de la variable
	DECF        _i+0, 1 
;PMW.c,41 :: 		}
	GOTO        L_main6
L_main7:
;PMW.c,43 :: 		delay_ms (30);                  // Retardo de 30ms
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       212
	MOVWF       R12, 0
	MOVLW       133
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
;PMW.c,44 :: 		}
	GOTO        L_main0
;PMW.c,45 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
