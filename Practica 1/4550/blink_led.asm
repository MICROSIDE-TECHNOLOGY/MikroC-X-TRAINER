
_main:

;blink_led.c,22 :: 		void main() org 0x2000          //Se especifica el segmento a partir de cual se almacenara el programa ya que existe un espacio
;blink_led.c,24 :: 		LATA4_bit = 0;             //Se asigna el pin como salida
	BCF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;blink_led.c,25 :: 		TRISA4_bit = 0;            //Se establece el pin en un estado bajo
	BCF         TRISA4_bit+0, BitPos(TRISA4_bit+0) 
;blink_led.c,27 :: 		while(1)
L_main0:
;blink_led.c,29 :: 		LED = 1;           //Se establece como estado alto el pin digital
	BSF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;blink_led.c,30 :: 		Delay_ms(1000);    //Se establece un espera de 1 segundo
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;blink_led.c,31 :: 		LED = 0;           //Se establece como estado bajo el pin digital
	BCF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;blink_led.c,32 :: 		Delay_ms(1000);    //Se establece un espera de 1 segundo
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;blink_led.c,33 :: 		}
	GOTO        L_main0
;blink_led.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
