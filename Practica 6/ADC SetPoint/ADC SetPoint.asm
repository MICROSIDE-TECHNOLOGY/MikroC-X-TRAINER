
_main:

;ADC SetPoint.c,18 :: 		void main() org 0x2000                         //vector de inicio usando bootloader MICROSIDE
;ADC SetPoint.c,20 :: 		LATA1_bit = 0;                             //SALIDA A 0
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;ADC SetPoint.c,21 :: 		TRISA1_bit = 0;                            //PIN COMO SALIDA
	BCF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;ADC SetPoint.c,22 :: 		ANSA1_bit = 0;                             //PIN COMO DIGITAL
	BCF         ANSA1_bit+0, BitPos(ANSA1_bit+0) 
;ADC SetPoint.c,23 :: 		TRISA3_bit = 1;                            //PIN como entrada
	BSF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;ADC SetPoint.c,24 :: 		ANSA3_bit = 1;                             //PIN como analógico
	BSF         ANSA3_bit+0, BitPos(ANSA3_bit+0) 
;ADC SetPoint.c,26 :: 		ADC_Init_Advanced(_ADC_INTERNAL_REF);      //Voltaje de referencia a VDD y GND
	CLRF        FARG_ADC_Init_Advanced_reference+0 
	CALL        _ADC_Init_Advanced+0, 0
;ADC SetPoint.c,27 :: 		while (1)
L_main0:
;ADC SetPoint.c,29 :: 		ValorPOT=ADC_Get_Sample(3);            //Leer el valor del potenciometro
	MOVLW       3
	MOVWF       FARG_ADC_Get_Sample_channel+0 
	CALL        _ADC_Get_Sample+0, 0
	MOVF        R0, 0 
	MOVWF       _ValorPOT+0 
	MOVF        R1, 0 
	MOVWF       _ValorPOT+1 
;ADC SetPoint.c,31 :: 		if(ValorPot <= 512)                    //Compara el valor de el ADC con 512
	MOVF        R1, 0 
	SUBLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main5
	MOVF        R0, 0 
	SUBLW       0
L__main5:
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;ADC SetPoint.c,33 :: 		LED_OFF;                           //Apaga el LED
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;ADC SetPoint.c,34 :: 		}
	GOTO        L_main3
L_main2:
;ADC SetPoint.c,38 :: 		LED_ON;   //Enciende el LED
	BSF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;ADC SetPoint.c,39 :: 		}
L_main3:
;ADC SetPoint.c,41 :: 		}
	GOTO        L_main0
;ADC SetPoint.c,42 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
