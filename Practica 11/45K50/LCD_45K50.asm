
_Move_Delay:

;LCD_45K50.c,39 :: 		void Move_Delay() {             //Función utilizada para el movimiento del texto
;LCD_45K50.c,40 :: 		Delay_ms(500);                //Velocidad de movimiento del texto
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_Move_Delay0:
	DECFSZ      R13, 1, 1
	BRA         L_Move_Delay0
	DECFSZ      R12, 1, 1
	BRA         L_Move_Delay0
	DECFSZ      R11, 1, 1
	BRA         L_Move_Delay0
	NOP
;LCD_45K50.c,41 :: 		}
L_end_Move_Delay:
	RETURN      0
; end of _Move_Delay

_main:

;LCD_45K50.c,43 :: 		void main() org 0x2000
;LCD_45K50.c,45 :: 		ANSELB  = 0;                  //Configura el puerto B como pines digitales
	CLRF        ANSELB+0 
;LCD_45K50.c,46 :: 		C1ON_bit = 0;                 //Deshabilita los comparadores
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;LCD_45K50.c,47 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;LCD_45K50.c,48 :: 		TRISA0_bit = 1;               //PIN como entrada
	BSF         TRISA0_bit+0, BitPos(TRISA0_bit+0) 
;LCD_45K50.c,49 :: 		ANSA0_bit = 1;                //PIN como analógico
	BSF         ANSA0_bit+0, BitPos(ANSA0_bit+0) 
;LCD_45K50.c,51 :: 		Lcd_Init();                   //Inicializa el LCD
	CALL        _Lcd_Init+0, 0
;LCD_45K50.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);          //Limpia el display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_45K50.c,54 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);     //Posiciona el Cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_45K50.c,55 :: 		Lcd_Out(1,6,txt1);            //Escribe en la primera linea
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_45K50.c,56 :: 		Lcd_Out(2,6,txt2);            //Escribe en la segunda linea
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_45K50.c,57 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
	NOP
;LCD_45K50.c,58 :: 		Lcd_Cmd(_LCD_CLEAR);          //limpia el display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_45K50.c,60 :: 		Lcd_Out(1,1,txt1);            //Escribe en la primera linea
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_45K50.c,61 :: 		Lcd_Out(2,5,txt2);            //Escribe en la segunda linea
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_45K50.c,63 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
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
;LCD_45K50.c,65 :: 		for(i=0; i<4; i++) {          //Mueve el texto 4 casillas a la derecha
	CLRF        _i+0 
L_main3:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;LCD_45K50.c,66 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_45K50.c,67 :: 		Move_Delay();
	CALL        _Move_Delay+0, 0
;LCD_45K50.c,65 :: 		for(i=0; i<4; i++) {          //Mueve el texto 4 casillas a la derecha
	INCF        _i+0, 1 
;LCD_45K50.c,68 :: 		}
	GOTO        L_main3
L_main4:
;LCD_45K50.c,70 :: 		while(1) {                    //inicia el cliclo infinito
L_main6:
;LCD_45K50.c,71 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Izquierda
	CLRF        _i+0 
L_main8:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;LCD_45K50.c,72 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_45K50.c,73 :: 		Move_Delay();
	CALL        _Move_Delay+0, 0
;LCD_45K50.c,71 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Izquierda
	INCF        _i+0, 1 
;LCD_45K50.c,74 :: 		}
	GOTO        L_main8
L_main9:
;LCD_45K50.c,76 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Derecha
	CLRF        _i+0 
L_main11:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;LCD_45K50.c,77 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_45K50.c,78 :: 		Move_Delay();
	CALL        _Move_Delay+0, 0
;LCD_45K50.c,76 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Derecha
	INCF        _i+0, 1 
;LCD_45K50.c,79 :: 		}
	GOTO        L_main11
L_main12:
;LCD_45K50.c,80 :: 		}
	GOTO        L_main6
;LCD_45K50.c,81 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
