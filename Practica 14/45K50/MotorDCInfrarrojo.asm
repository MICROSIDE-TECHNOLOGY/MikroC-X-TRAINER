
_main:

;MotorDCInfrarrojo.c,20 :: 		void main(void) org 0x2000
;MotorDCInfrarrojo.c,22 :: 		TRISC = 0X00;                          // Declaramos el puerto como salida
	CLRF        TRISC+0 
;MotorDCInfrarrojo.c,23 :: 		PWM1_Init (5000);                      // Inicializa PWM a 5000 Hz
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       149
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;MotorDCInfrarrojo.c,24 :: 		PWM1_Start ();
	CALL        _PWM1_Start+0, 0
;MotorDCInfrarrojo.c,25 :: 		TRISA0_bit = 1;                        //PIN como entrada
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;MotorDCInfrarrojo.c,26 :: 		ANSA0_bit = 1;                         //PIN como analógico
	BSF         ANSA0_bit+0, BitPos(ANSA0_bit+0) 
;MotorDCInfrarrojo.c,27 :: 		ADC_Init_Advanced(_ADC_INTERNAL_REF);  //Voltaje de referencia a VDD y GND
	CLRF        FARG_ADC_Init_Advanced_reference+0 
	CALL        _ADC_Init_Advanced+0, 0
;MotorDCInfrarrojo.c,29 :: 		while (1)
L_main0:
;MotorDCInfrarrojo.c,31 :: 		VALOR_ADC = ADC_Get_Sample(3)*1.53; //Lee el valor del ADC y lo guarda en la variable
	MOVLW       3
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	CALL        _word2double+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       67
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _VALOR_ADC+0 
	MOVF        R1, 0 
	MOVWF       _VALOR_ADC+1 
;MotorDCInfrarrojo.c,32 :: 		PWM1_Set_Duty (VALOR_ADC);
	MOVF        R0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;MotorDCInfrarrojo.c,33 :: 		}
	GOTO        L_main0
;MotorDCInfrarrojo.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
