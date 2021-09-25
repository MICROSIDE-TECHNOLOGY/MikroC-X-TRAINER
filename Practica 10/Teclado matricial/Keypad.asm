
_getKey:

;Keypad.c,20 :: 		char getKey (void)           //Función tipo char que posee todos los casos posibles
;Keypad.c,22 :: 		char kp = 0;               //Se inicializa la variable local kp como 0
	CLRF        getKey_kp_L0+0 
;Keypad.c,23 :: 		kp = Keypad_Key_Press();   //Se instancia el método que lee la tecla y la aloja en kp
	CALL        _Keypad_Key_Press+0, 0
	MOVF        R0, 0 
	MOVWF       getKey_kp_L0+0 
;Keypad.c,24 :: 		switch (kp)                //Se instancia y ejecuta un ciclo case con lo guardado en kp
	GOTO        L_getKey0
;Keypad.c,26 :: 		case 1:
L_getKey2:
;Keypad.c,27 :: 		return '1';          //1 usando código ASCII - 49
	MOVLW       49
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,28 :: 		case 2:
L_getKey3:
;Keypad.c,29 :: 		return '2';          //2 usando código ASCII - 50
	MOVLW       50
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,30 :: 		case 3:
L_getKey4:
;Keypad.c,31 :: 		return '3';          //3 usando código ASCII - 51
	MOVLW       51
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,32 :: 		case 4:
L_getKey5:
;Keypad.c,33 :: 		return 'A';          //A usando código ASCII - 65
	MOVLW       65
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,34 :: 		case 5:
L_getKey6:
;Keypad.c,35 :: 		return '4';          //4 usando código ASCII - 52
	MOVLW       52
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,36 :: 		case 6:
L_getKey7:
;Keypad.c,37 :: 		return '5';          //5 usando código ASCII - 53
	MOVLW       53
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,38 :: 		case 7:
L_getKey8:
;Keypad.c,39 :: 		return '6';          //6 usando código ASCII - 54
	MOVLW       54
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,40 :: 		case 8:
L_getKey9:
;Keypad.c,41 :: 		return 'B';          //B usando código ASCII - 66
	MOVLW       66
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,42 :: 		case 9:
L_getKey10:
;Keypad.c,43 :: 		return '7';          //7 usando código ASCII - 55
	MOVLW       55
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,44 :: 		case 10:
L_getKey11:
;Keypad.c,45 :: 		return '8';          //8 usando código ASCII - 56
	MOVLW       56
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,46 :: 		case 11:
L_getKey12:
;Keypad.c,47 :: 		return '9';          //9 usando código ASCII - 57
	MOVLW       57
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,48 :: 		case 12:
L_getKey13:
;Keypad.c,49 :: 		return 'C';          //C usando código ASCII - 67
	MOVLW       67
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,50 :: 		case 13:
L_getKey14:
;Keypad.c,51 :: 		return '*';          //* usando código ASCII - 42
	MOVLW       42
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,52 :: 		case 14:
L_getKey15:
;Keypad.c,53 :: 		return '0';          //0 usando código ASCII - 48
	MOVLW       48
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,54 :: 		case 15:
L_getKey16:
;Keypad.c,55 :: 		return '#';          //# usando código ASCII - 35
	MOVLW       35
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,56 :: 		case 16:
L_getKey17:
;Keypad.c,57 :: 		return 'D';          //D usando código ASCII - 68
	MOVLW       68
	MOVWF       R0 
	GOTO        L_end_getKey
;Keypad.c,58 :: 		default:
L_getKey18:
;Keypad.c,59 :: 		return 0;            //Si no coincide un caso, regresa a cero, vuelve a empezar el case
	CLRF        R0 
	GOTO        L_end_getKey
;Keypad.c,60 :: 		}
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
;Keypad.c,61 :: 		}
L_end_getKey:
	RETURN      0
; end of _getKey

_main:

;Keypad.c,63 :: 		void main ()org 0x2000       //Vector de inicio usando el bootloader de Microside
;Keypad.c,66 :: 		LATA1_bit = 0;              //Escribe ceros en el puerto A1
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Keypad.c,67 :: 		TRISA1_bit = 0;             //Se declara el puerto A1 como salida
	BCF         TRISA1_bit+0, BitPos(TRISA1_bit+0) 
;Keypad.c,68 :: 		ANSA1_bit = 0;              //Se declara el puerto A1 como señal digital
	BCF         ANSA1_bit+0, BitPos(ANSA1_bit+0) 
;Keypad.c,69 :: 		Keypad_Init ();             //Se manda a instanciar la libería para el teclado matricial
	CALL        _Keypad_Init+0, 0
;Keypad.c,70 :: 		getKey ();                  //Se manda a instanciar la función que contiene todos los cases
	CALL        _getKey+0, 0
;Keypad.c,72 :: 		while (1)                   //Mientras sea verdadero se ejecuta el bucle infinitamente
L_main19:
;Keypad.c,74 :: 		key = getKey ();           //Se manda a asignar la función a una variable para su uso
	CALL        _getKey+0, 0
	MOVF        R0, 0 
	MOVWF       main_key_L0+0 
;Keypad.c,75 :: 		if (key == '1')            //Si key es igual a la condición entre comillas
	MOVF        R0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;Keypad.c,77 :: 		Led_On;                   //Led enciende
	BSF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Keypad.c,78 :: 		}
	GOTO        L_main22
L_main21:
;Keypad.c,80 :: 		else if (key == '0')       //Si no es igual key a la condición entre comillas
	MOVF        main_key_L0+0, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Keypad.c,82 :: 		Led_Off;                  //Led se apaga
	BCF         LATA1_bit+0, BitPos(LATA1_bit+0) 
;Keypad.c,83 :: 		}
L_main23:
L_main22:
;Keypad.c,84 :: 		}
	GOTO        L_main19
;Keypad.c,85 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
