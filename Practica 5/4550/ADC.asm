
_main:

;ADC.c,23 :: 		void main() org 0x2000                      //vector de inicio usando bootloader MICROSIDE
;ADC.c,26 :: 		TRISA0_bit = 1;                         //PIN como entrada
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;ADC.c,27 :: 		TRISB = 0;
	CLRF        TRISB+0 
;ADC.c,29 :: 		while (1)
L_main0:
;ADC.c,31 :: 		ValorPOT=ADC_Read(0);               //Leer el valor del potenciometro
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _ValorPOT+0 
	MOVF        R1, 0 
	MOVWF       _ValorPOT+1 
;ADC.c,33 :: 		if(ValorPot <=114)                 //Compara el valor de el ADC con 114
	MOVLW       0
	MOVWF       R2 
	MOVF        R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVF        R0, 0 
	SUBLW       114
L__main20:
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;ADC.c,35 :: 		LATB=0b00000000;              // Leds activos
	CLRF        LATB+0 
;ADC.c,36 :: 		}
	GOTO        L_main3
L_main2:
;ADC.c,37 :: 		else if(ValorPot <=228)         //Compara el valor de el ADC con 228
	MOVLW       0
	MOVWF       R0 
	MOVF        _ValorPOT+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVF        _ValorPOT+0, 0 
	SUBLW       228
L__main21:
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
;ADC.c,39 :: 		LATB=0b00000001;              // Leds activos
	MOVLW       1
	MOVWF       LATB+0 
;ADC.c,40 :: 		}
	GOTO        L_main5
L_main4:
;ADC.c,41 :: 		else if(ValorPot <=342)       //Compara el valor de el ADC con 342
	MOVF        _ValorPOT+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVF        _ValorPOT+0, 0 
	SUBLW       86
L__main22:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;ADC.c,43 :: 		LATB=0b00000011;              // Leds activos
	MOVLW       3
	MOVWF       LATB+0 
;ADC.c,44 :: 		}
	GOTO        L_main7
L_main6:
;ADC.c,45 :: 		else if(ValorPot <=456)       //Compara el valor de el ADC con 456
	MOVF        _ValorPOT+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVF        _ValorPOT+0, 0 
	SUBLW       200
L__main23:
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
;ADC.c,47 :: 		LATB=0b00000111;              // Leds activos
	MOVLW       7
	MOVWF       LATB+0 
;ADC.c,48 :: 		}
	GOTO        L_main9
L_main8:
;ADC.c,49 :: 		else if(ValorPot <=570)       //Compara el valor de el ADC con 570
	MOVF        _ValorPOT+1, 0 
	SUBLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVF        _ValorPOT+0, 0 
	SUBLW       58
L__main24:
	BTFSS       STATUS+0, 0 
	GOTO        L_main10
;ADC.c,51 :: 		LATB=0b00001111;              // Leds activos
	MOVLW       15
	MOVWF       LATB+0 
;ADC.c,52 :: 		}
	GOTO        L_main11
L_main10:
;ADC.c,53 :: 		else if(ValorPot <=684)      //Compara el valor de el ADC con 684
	MOVF        _ValorPOT+1, 0 
	SUBLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVF        _ValorPOT+0, 0 
	SUBLW       172
L__main25:
	BTFSS       STATUS+0, 0 
	GOTO        L_main12
;ADC.c,55 :: 		LATB=0b00011111;              // Leds activos
	MOVLW       31
	MOVWF       LATB+0 
;ADC.c,56 :: 		}
	GOTO        L_main13
L_main12:
;ADC.c,57 :: 		else if(ValorPot <=798)       //Compara el valor de el ADC con 798
	MOVF        _ValorPOT+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main26
	MOVF        _ValorPOT+0, 0 
	SUBLW       30
L__main26:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
;ADC.c,59 :: 		LATB=0b00111111;              // Leds activos
	MOVLW       63
	MOVWF       LATB+0 
;ADC.c,60 :: 		}
	GOTO        L_main15
L_main14:
;ADC.c,61 :: 		else if(ValorPot <=912)       //Compara el valor de el ADC con 912
	MOVF        _ValorPOT+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main27
	MOVF        _ValorPOT+0, 0 
	SUBLW       144
L__main27:
	BTFSS       STATUS+0, 0 
	GOTO        L_main16
;ADC.c,63 :: 		LATB=0b01111111;              // Leds activos
	MOVLW       127
	MOVWF       LATB+0 
;ADC.c,64 :: 		}
	GOTO        L_main17
L_main16:
;ADC.c,65 :: 		else if(ValorPot <=1024)      //Compara el valor de el ADC con 1024
	MOVF        _ValorPOT+1, 0 
	SUBLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	MOVF        _ValorPOT+0, 0 
	SUBLW       0
L__main28:
	BTFSS       STATUS+0, 0 
	GOTO        L_main18
;ADC.c,67 :: 		LATB=0b11111111;              // Leds activos
	MOVLW       255
	MOVWF       LATB+0 
;ADC.c,68 :: 		}
L_main18:
L_main17:
L_main15:
L_main13:
L_main11:
L_main9:
L_main7:
L_main5:
L_main3:
;ADC.c,70 :: 		}
	GOTO        L_main0
;ADC.c,72 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
