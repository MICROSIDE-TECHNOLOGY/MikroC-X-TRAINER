
_main:

;Contador_binario.c,16 :: 		void main() org 0x2000          //vector de inicio usando bootloader MICROSIDE
;Contador_binario.c,18 :: 		TRISB = 0x00;               //Puerto B como salida
	CLRF        TRISB+0 
;Contador_binario.c,19 :: 		TRISA2_bit = 1;             //Pin A2 como entrada
	BSF         TRISA2_bit+0, BitPos(TRISA2_bit+0) 
;Contador_binario.c,20 :: 		ANSA2_bit = 0;              //Pin A2 como entrada digital
	BCF         ANSA2_bit+0, BitPos(ANSA2_bit+0) 
;Contador_binario.c,21 :: 		PORTB = 0X00;               //Puerto B en estado bajo
	CLRF        PORTB+0 
;Contador_binario.c,22 :: 		while(1){
L_main0:
;Contador_binario.c,23 :: 		if (Boton==0) {         //Pregunta el estado del boton
	BTFSC       PORTA+0, 2 
	GOTO        L_main2
;Contador_binario.c,24 :: 		cont++;
	INFSNZ      _cont+0, 1 
	INCF        _cont+1, 1 
;Contador_binario.c,25 :: 		PORTB = cont;        //Despliega el valor a PORTB
	MOVF        _cont+0, 0 
	MOVWF       PORTB+0 
;Contador_binario.c,26 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
;Contador_binario.c,27 :: 		while (Boton==0);
L_main4:
	BTFSC       PORTA+0, 2 
	GOTO        L_main5
	GOTO        L_main4
L_main5:
;Contador_binario.c,28 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
;Contador_binario.c,29 :: 		}
L_main2:
;Contador_binario.c,30 :: 		}
	GOTO        L_main0
;Contador_binario.c,32 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
