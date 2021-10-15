
_main:

;push_button.c,27 :: 		void main() org 0x2000          //Se instancia el vector de inicio usando bootloader MICROSIDE
;push_button.c,29 :: 		LATA4_bit = 0;                //Escribe ceros a la salida del pin A4
	BCF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;push_button.c,30 :: 		TRISA4_bit = 0;               //Se declara como un pin de salida
	BCF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;push_button.c,31 :: 		TRISA2_bit = 1;               //Se declara como un pin de entrada
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;push_button.c,32 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;push_button.c,34 :: 		while(1)
L_main0:
;push_button.c,36 :: 		if (Boton==1) {             //Pregunta el estado del boton
	BTFSS       PORTA+0, 2 
	GOTO        L_main2
;push_button.c,37 :: 		LED_OFF;                 //Apaga el LED
	BCF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;push_button.c,38 :: 		} else {
	GOTO        L_main3
L_main2:
;push_button.c,39 :: 		LED_ON;                  //Enciende el LED
	BSF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;push_button.c,40 :: 		}
L_main3:
;push_button.c,41 :: 		}
	GOTO        L_main0
;push_button.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
