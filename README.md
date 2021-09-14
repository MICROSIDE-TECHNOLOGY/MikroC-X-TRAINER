# MikroC-X-TRAINER
Prácticas compatibles con el PIC 18F45K50 y el compilador de MikroC para la placa de aprendizaje X-TRAINER de Microside

## Práctica 1 - Blink LED
>[Práctica 1.](https://github.com/MICROSIDE-TECHNOLOGY/MikroC-X-TRAINER/tree/main/Practica%201#pr%C3%A1ctica-1---blink-led)
En esta práctica se utiliza el LED que se encuentra conectado al pin A1 del módulo X-TRAINER con el PIC18F4550/45K50. El pin A1 es configurado como salida y señal digital, y enciende o apaga cada determinado tiempo.

## Práctica 2 - Push Button
>[Práctica 2.](https://github.com/MICROSIDE-TECHNOLOGY/MikroC-X-TRAINER/blob/main/Practica%202/Push_button/Push_Button_.c)
En esta práctica se utiliza el LED que se encuentra conectado al pin A1 del módulo X-TRAINER con el PIC18F4550/45K50. El pin A1 es configurado como salida y señal digital, y el pin A2 de dicho módulo, es configurado como una entrada y señal digital para saber el estado del botón BOOT; por lo que el estado del LED cambiará a encendido cuando se presione el botón.

## Práctica 3 – Corrimiento de bits
>[Práctica 3.](https://github.com/MICROSIDE-TECHNOLOGY/MikroC-X-TRAINER/blob/main/Practica%203/corrimiento_bits/Corrimiento_bits.c)
En esta práctica se implementa un corrimiento de bits usando el módulo X-TRAINER con el PIC18F4550/45K50. Para visualizar el resultado se conectan 8 LEDs al puerto B del módulo X-TRAINER.

## Práctica 4 – Contador binario
>[Práctica 4.](https://github.com/MICROSIDE-TECHNOLOGY/MikroC-X-TRAINER/blob/main/Practica%204/contador_binario/Contador_binario.c)
En esta práctica se implementa un contador binario usando el módulo X-TRAINER con el PIC18F4550/45K50. El contador se incrementa cada vez que se presiona un botón conectado al pin A2, configurado como entrada digital. Para visualizar el valor del contador se utilizan 8 LEDs.

## Práctica 5 – ADC
>[Práctica 5.](https://github.com/MICROSIDE-TECHNOLOGY/MikroC-X-TRAINER/blob/main/Practica%205/ADC/ADC.c)
En esta práctica se implementa una lectura analógica, utilizando un potenciómetro, el cual se conecta al módulo X-TRAINER con el PIC18F4550/45K50. El potenciómetro se conecta en el pin A0, el cual se configura como entrada y señal analógica. Para visualizar dicha lectura se utilizan 8 LEDs, conectados al puerto B, de tal manera que pueda observarse el incremento o decremento de voltaje del potenciómetro.

## Práctica 22 – Comunicación Serial
>[Práctica 22.](https://github.com/MICROSIDE-TECHNOLOGY/MikroC-X-TRAINER/blob/main/Practica%2022/Comunicacion_UART/SERIAL.c)
En esta práctica se implementa una comunicación serial UART a 9600 baudios, usando el módulo X-TRAINER con el PIC18F4550/45K50. Desde una terminal serial que proporciona el software MICROSIDE, se envían y reciben datos por medio del módulo XCU. Para encender el LED incluido en el módulo X-TRAINER se envía el número 1, si se desea apagar se envía el número 0. Para recibir el estado del botón BOOT, se envía el signo “?”, si el botón está presionado recibe el número 1, en caso contrario se recibe el número 0.
