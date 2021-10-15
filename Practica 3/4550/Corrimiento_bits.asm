
_main:

;Corrimiento_bits.c,21 :: 		void main() org 0x2000                         //vector de inicio usando bootloader MICROSIDE
;Corrimiento_bits.c,23 :: 		TRISB = 0x00;                              //Puerto B como salida
	CLRF        TRISB+0 
;Corrimiento_bits.c,24 :: 		PORTB = 0X0D;
	MOVLW       13
	MOVWF       PORTB+0 
;Corrimiento_bits.c,26 :: 		while(1){
L_main0:
;Corrimiento_bits.c,27 :: 		Delay_ms(200);                         //Espera de 200 ms
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
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
;Corrimiento_bits.c,28 :: 		PORTB = (PORTB << 1) | (PORTB >> 7);   //Funcion que realiza el corrimiento en las salidas digitales
	MOVF        PORTB+0, 0 
	MOVWF       R2 
	RLCF        R2, 1 
	BCF         R2, 0 
	MOVLW       7
	MOVWF       R1 
	MOVF        PORTB+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__main4:
	BZ          L__main5
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__main4
L__main5:
	MOVF        R0, 0 
	IORWF       R2, 0 
	MOVWF       PORTB+0 
;Corrimiento_bits.c,29 :: 		}
	GOTO        L_main0
;Corrimiento_bits.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
