
_main:

;Blink_LED_.c,15 :: 		void main() org 0x2000                          //Se especifica el segmento a partir de cual se almacenara el programa ya que existe un espacio
;Blink_LED_.c,18 :: 		LATA1_bit = 0;                             //Se asigna el pin como salida
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Blink_LED_.c,19 :: 		TRISA1_bit = 0;                            //Se establece el pin en un estado bajo
	BCF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;Blink_LED_.c,20 :: 		ANSA1_bit = 0;                             //Se configura el pin como salida digital
	BCF         ANSA1_bit+0, BitPos(ANSA1_bit+0) 
;Blink_LED_.c,22 :: 		while(1)
L_main0:
;Blink_LED_.c,24 :: 		LED = 1;                           //Se establece como estado alto el pin digital
	BSF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Blink_LED_.c,25 :: 		Delay_ms(1000);                    //Se establece un espera de 1 segundo
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
;Blink_LED_.c,26 :: 		LED = 0;                           //Se establece como estado bajo el pin digital
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Blink_LED_.c,27 :: 		Delay_ms(1000);                    //Se establece un espera de 1 segundo
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
;Blink_LED_.c,28 :: 		}
	GOTO        L_main0
;Blink_LED_.c,29 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
