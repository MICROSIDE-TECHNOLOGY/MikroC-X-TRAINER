
_Move_Delay:

;LCD_4550_.c,39 :: 		void Move_Delay() {             //Función utilizada para el movimiento del texto
;LCD_4550_.c,40 :: 		Delay_ms(500);                //Velocidad de movimiento del texto
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
;LCD_4550_.c,41 :: 		}
L_end_Move_Delay:
	RETURN      0
; end of _Move_Delay

_main:

;LCD_4550_.c,43 :: 		void main() org 0x2000
;LCD_4550_.c,45 :: 		Lcd_Init();                   //Inicializa el LCD
	CALL        _Lcd_Init+0, 0
;LCD_4550_.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);          //Limpia el display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_4550_.c,48 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);     //Posiciona el Cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_4550_.c,49 :: 		Lcd_Out(1,6,txt1);            //Escribe en la primera linea
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_4550_.c,50 :: 		Lcd_Out(2,6,txt2);            //Escribe en la segunda linea
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_4550_.c,51 :: 		Delay_ms(2000);
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
;LCD_4550_.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);          //limpia el display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_4550_.c,54 :: 		Lcd_Out(1,1,txt1);            //Escribe en la primera linea
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_4550_.c,55 :: 		Lcd_Out(2,5,txt2);            //Escribe en la segunda linea
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LCD_4550_.c,57 :: 		Delay_ms(2000);
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
;LCD_4550_.c,59 :: 		for(i=0; i<4; i++) {          //Mueve el texto 4 casillas a la derecha
	CLRF        _i+0 
L_main3:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;LCD_4550_.c,60 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_4550_.c,61 :: 		Move_Delay();
	CALL        _Move_Delay+0, 0
;LCD_4550_.c,59 :: 		for(i=0; i<4; i++) {          //Mueve el texto 4 casillas a la derecha
	INCF        _i+0, 1 
;LCD_4550_.c,62 :: 		}
	GOTO        L_main3
L_main4:
;LCD_4550_.c,64 :: 		while(1) {                    //inicia el cliclo infinito
L_main6:
;LCD_4550_.c,65 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Izquierda
	CLRF        _i+0 
L_main8:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;LCD_4550_.c,66 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_4550_.c,67 :: 		Move_Delay();
	CALL        _Move_Delay+0, 0
;LCD_4550_.c,65 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Izquierda
	INCF        _i+0, 1 
;LCD_4550_.c,68 :: 		}
	GOTO        L_main8
L_main9:
;LCD_4550_.c,70 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Derecha
	CLRF        _i+0 
L_main11:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;LCD_4550_.c,71 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW       28
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LCD_4550_.c,72 :: 		Move_Delay();
	CALL        _Move_Delay+0, 0
;LCD_4550_.c,70 :: 		for(i=0; i<8; i++) {        //Mueve el texto 7 casillas a la Derecha
	INCF        _i+0, 1 
;LCD_4550_.c,73 :: 		}
	GOTO        L_main11
L_main12:
;LCD_4550_.c,74 :: 		}
	GOTO        L_main6
;LCD_4550_.c,75 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
