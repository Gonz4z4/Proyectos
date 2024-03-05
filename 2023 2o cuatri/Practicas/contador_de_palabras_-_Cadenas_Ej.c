/*
Escribe un programa en el que se pida al usuario que ingrese una
oración (maximo 50 caracteres) e imprima por pantalla la cantidad
de palabras en la oración.
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main() {
    char cadena[50];
    int cantP = 1;
    printf("Ingrese una oracion:\n");
    gets(cadena);

    for (int i = 0; cadena[i] != '\0'; i++) {
        if ((cadena[i]==32) && (cadena[i]!='/0')){
            cantP++;
        }
    }
    printf("Cantidad de palabras: %i",cantP);
}
