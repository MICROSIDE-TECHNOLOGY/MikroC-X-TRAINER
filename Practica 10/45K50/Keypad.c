/*******************************************************************************
Company:
Microside Technology Inc.

Product Revision  :  1
Device            :  X-TRAINER
Driver Version    :  1.0
********************************************************************************/

/*******************************************************************************
Para usar el código con bootloader, configurar como lo indica MICROSIDE:
1) Tools> Options> Output> Output Settings> Marcar "Long HEX format"
2) Project> Edit Project> Insertar 48000000 en "MCU Clock Frequency [MHz]" box
********************************************************************************/

//Se declaran las variables globales, librerias y se reserva el espacio para el bootloader
#pragma orgall 0x1FFF
#define Led_On       LATA1_bit = 1
#define Led_Off      LATA1_bit = 0

char keypadPort at PORTB;
char key;                   //Se crea una variable local tipo char

//Función para leer el teclado matricial a tráves de un ciclo case
char getKey (void)           //Función tipo char que posee todos los casos posibles
{
  char kp = 0;               //Se inicializa la variable local kp como 0
  kp = Keypad_Key_Press();   //Se instancia el método que lee la tecla y la aloja en kp
  switch (kp)                //Se instancia y ejecuta un ciclo case con lo guardado en kp
  {
   case 1:
        return '1';          //1 usando código ASCII - 49
   case 2:
        return '2';          //2 usando código ASCII - 50
   case 3:
        return '3';          //3 usando código ASCII - 51
   case 4:
        return 'A';          //A usando código ASCII - 65
   case 5:
        return '4';          //4 usando código ASCII - 52
   case 6:
        return '5';          //5 usando código ASCII - 53
   case 7:
        return '6';          //6 usando código ASCII - 54
   case 8:
        return 'B';          //B usando código ASCII - 66
   case 9:
        return '7';          //7 usando código ASCII - 55
   case 10:
        return '8';          //8 usando código ASCII - 56
   case 11:
        return '9';          //9 usando código ASCII - 57
   case 12:
        return 'C';          //C usando código ASCII - 67
   case 13:
        return '*';          //* usando código ASCII - 42
   case 14:
        return '0';          //0 usando código ASCII - 48
   case 15:
        return '#';          //# usando código ASCII - 35
   case 16:
        return 'D';          //D usando código ASCII - 68
   default:
        return 0;            //Si no coincide un caso, regresa a cero, vuelve a empezar el case
  }
}

//Se crea el programa a ejecutarse infinitamente
void main ()org 0x2000       //Vector de inicio usando el bootloader de Microside
{
                             //Se configuran las entradas y salidas del PIC
 LATA1_bit = 0;              //Escribe ceros en el puerto A1
 TRISA1_bit = 0;             //Se declara el puerto A1 como salida
 ANSA1_bit = 0;              //Se declara el puerto A1 como señal digital

 Keypad_Init ();             //Se manda a instanciar la libería para el teclado matricial
 getKey ();                  //Se manda a instanciar la función que contiene todos los cases
 while (1)                   //Mientras sea verdadero se ejecuta el bucle infinitamente
 {
    key = getKey ();         //Se manda a asignar la función a una variable para su uso
    if (key == '1')          //Si key es igual a la condición entre comillas
    {
     Led_On;                 //Led enciende
    }

    else if (key == '0')     //Si no es igual key a la condición entre comillas
    {
     Led_Off;                //Led se apaga
    }
 }
}