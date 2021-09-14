
_main:

;Push_Button_.c,18 :: 		void main() org 0x2000                   //Se instancia el vector de inicio usando bootloader MICROSIDE
;Push_Button_.c,20 :: 		LATA1_bit = 0;                         //Escribe ceros a la salida del pin A1
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Push_Button_.c,21 :: 		TRISA1_bit = 0;                        //Se declara como un pin de salida
	BCF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;Push_Button_.c,22 :: 		ANSA1_bit = 0;                         //Se declara como un pin digital
	BCF         ANSA1_bit+0, BitPos(ANSA1_bit+0) 
;Push_Button_.c,23 :: 		TRISA2_bit = 1;                        //Se declara como un pin de entrada
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;Push_Button_.c,24 :: 		ANSA2_bit = 0;
	BCF         ANSA2_bit+0, BitPos(ANSA2_bit+0) 
;Push_Button_.c,26 :: 		while(1)
L_main0:
;Push_Button_.c,28 :: 		if (Boton==1) {                       //Pregunta el estado del boton
	BTFSS       PORTA+0, 2 
	GOTO        L_main2
;Push_Button_.c,29 :: 		LED_OFF;                           //Apaga el LED
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Push_Button_.c,30 :: 		} else {
	GOTO        L_main3
L_main2:
;Push_Button_.c,31 :: 		LED_ON;                            //Enciende el LED
	BSF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Push_Button_.c,32 :: 		}
L_main3:
;Push_Button_.c,33 :: 		}
	GOTO        L_main0
;Push_Button_.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
