
_getKey:

;Keypad.c,31 :: 		char getKey (void)           //Función tipo char que posee todos los casos posibles
;Keypad.c,33 :: 		char kp = 0;               //Se inicializa la variable local kp como 0
	CLRF        getKey_kp_L0+0 
;Keypad.c,34 :: 		kp = Keypad_Key_Press();   //Se instancia el método que lee la tecla y la aloja en kp
	CALL        _Keypad_Key_Press+0, 0
	MOVF        R0, 0 
	MOVWF       getKey_kp_L0+0 
;Keypad.c,35 :: 		switch (kp)                //Se instancia y ejecuta un ciclo case con lo guardado en kp
	GOTO        L_getKey0
;Keypad.c,37 :: 		case 1:
L_getKey2:
;Keypad.c,38 :: 		return '1';          //1 usando código ASCII - 49
	MOVLW       49
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,39 :: 		case 2:
L_getKey3:
;Keypad.c,40 :: 		return '2';          //2 usando código ASCII - 50
	MOVLW       50
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,41 :: 		case 3:
L_getKey4:
;Keypad.c,42 :: 		return '3';          //3 usando código ASCII - 51
	MOVLW       51
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,43 :: 		case 4:
L_getKey5:
;Keypad.c,44 :: 		return 'A';          //A usando código ASCII - 65
	MOVLW       65
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,45 :: 		case 5:
L_getKey6:
;Keypad.c,46 :: 		return '4';          //4 usando código ASCII - 52
	MOVLW       52
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,47 :: 		case 6:
L_getKey7:
;Keypad.c,48 :: 		return '5';          //5 usando código ASCII - 53
	MOVLW       53
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,49 :: 		case 7:
L_getKey8:
;Keypad.c,50 :: 		return '6';          //6 usando código ASCII - 54
	MOVLW       54
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,51 :: 		case 8:
L_getKey9:
;Keypad.c,52 :: 		return 'B';          //B usando código ASCII - 66
	MOVLW       66
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,53 :: 		case 9:
L_getKey10:
;Keypad.c,54 :: 		return '7';          //7 usando código ASCII - 55
	MOVLW       55
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,55 :: 		case 10:
L_getKey11:
;Keypad.c,56 :: 		return '8';          //8 usando código ASCII - 56
	MOVLW       56
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,57 :: 		case 11:
L_getKey12:
;Keypad.c,58 :: 		return '9';          //9 usando código ASCII - 57
	MOVLW       57
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,59 :: 		case 12:
L_getKey13:
;Keypad.c,60 :: 		return 'C';          //C usando código ASCII - 67
	MOVLW       67
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,61 :: 		case 13:
L_getKey14:
;Keypad.c,62 :: 		return '*';          //* usando código ASCII - 42
	MOVLW       42
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,63 :: 		case 14:
L_getKey15:
;Keypad.c,64 :: 		return '0';          //0 usando código ASCII - 48
	MOVLW       48
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,65 :: 		case 15:
L_getKey16:
;Keypad.c,66 :: 		return '#';          //# usando código ASCII - 35
	MOVLW       35
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,67 :: 		case 16:
L_getKey17:
;Keypad.c,68 :: 		return 'D';          //D usando código ASCII - 68
	MOVLW       68
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,69 :: 		default:
L_getKey18:
;Keypad.c,70 :: 		return 0;            //Si no coincide un caso, regresa a cero, vuelve a empezar el case
	CLRF        R0 
	GOTO        L_end_getKey
;Keypad.c,71 :: 		}
L_getKey0:
	MOVF        getKey_kp_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey2
	MOVF        getKey_kp_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey3
	MOVF        getKey_kp_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey4
	MOVF        getKey_kp_L0+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey5
	MOVF        getKey_kp_L0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey6
	MOVF        getKey_kp_L0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey7
	MOVF        getKey_kp_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey8
	MOVF        getKey_kp_L0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey9
	MOVF        getKey_kp_L0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey10
	MOVF        getKey_kp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey11
	MOVF        getKey_kp_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey12
	MOVF        getKey_kp_L0+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey13
	MOVF        getKey_kp_L0+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey14
	MOVF        getKey_kp_L0+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey15
	MOVF        getKey_kp_L0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey16
	MOVF        getKey_kp_L0+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_getKey17
	GOTO        L_getKey18
;Keypad.c,72 :: 		}
L_end_getKey:
	RETURN      0
; end of _getKey

_main:

;Keypad.c,75 :: 		void main ()org 0x2000       //Vector de inicio usando el bootloader de Microside
;Keypad.c,79 :: 		LATA1_bit = 0;              //Escribe ceros en el puerto A1
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Keypad.c,80 :: 		TRISA1_bit = 0;             //Se declara el puerto A1 como salida
	BCF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;Keypad.c,84 :: 		Keypad_Init ();             //Se manda a instanciar la libería para el teclado matricial
	CALL        _Keypad_Init+0, 0
;Keypad.c,85 :: 		getKey ();                  //Se manda a instanciar la función que contiene todos los cases
	CALL        _getKey+0, 0
;Keypad.c,86 :: 		while (1)                   //Mientras sea verdadero se ejecuta el bucle infinitamente
L_main19:
;Keypad.c,88 :: 		key = getKey ();           //Se manda a asignar la función a una variable para su uso
	CALL        _getKey+0, 0
	MOVF        R0, 0 
	MOVWF       _key+0 
;Keypad.c,89 :: 		if (key == '1')            //Si key es igual a la condición entre comillas
	MOVF        R0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;Keypad.c,91 :: 		Led_On;                   //Led enciende
	BSF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;Keypad.c,92 :: 		}
	GOTO        L_main22
L_main21:
;Keypad.c,94 :: 		else if (key == '0')       //Si no es igual key a la condición entre comillas
	MOVF        _key+0, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Keypad.c,96 :: 		Led_Off;                  //Led se apaga
	BCF         LATA4_bit+0, BitPos(LATA4_bit+0) 
;Keypad.c,97 :: 		}
L_main23:
L_main22:
;Keypad.c,98 :: 		}
	GOTO        L_main19
;Keypad.c,99 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
