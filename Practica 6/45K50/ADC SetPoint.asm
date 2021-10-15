
_main:

;ADC SetPoint.c,28 :: 		void main() org 0x2000                   //vector de inicio usando bootloader MICROSIDE
;ADC SetPoint.c,30 :: 		LATA4_bit = 0;                       //SALIDA A4
	BCF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;ADC SetPoint.c,31 :: 		TRISA4_bit = 0;                      //PIN COMO SALIDA
	BCF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;ADC SetPoint.c,32 :: 		TRISA0_bit = 1;                      //PIN como entrada
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;ADC SetPoint.c,33 :: 		ANSA0_bit = 1;                       //PIN como analógico
	BSF         ANSA0_bit+0, BitPos(ANSA0_bit+0) 
;ADC SetPoint.c,35 :: 		while (1)
L_main0:
;ADC SetPoint.c,37 :: 		ValorPOT=ADC_Read(0);            //Leer el valor del potenciometro
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ValorPOT+0 
	MOVF        R1, 0 
	MOVWF       _ValorPOT+1 
;ADC SetPoint.c,39 :: 		if(ValorPot <= 512)              //Compara el valor de el ADC con 512
	MOVF        R1, 0 
	SUBLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main5
	MOVF        R0, 0 
	SUBLW       0
L__main5:
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;ADC SetPoint.c,41 :: 		LED_OFF;                     //Apaga el LED
	BCF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;ADC SetPoint.c,42 :: 		}
	GOTO        L_main3
L_main2:
;ADC SetPoint.c,46 :: 		LED_ON;                        //Enciende el LED
	BSF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;ADC SetPoint.c,47 :: 		}
L_main3:
;ADC SetPoint.c,49 :: 		}
	GOTO        L_main0
;ADC SetPoint.c,50 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
