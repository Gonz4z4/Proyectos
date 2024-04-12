#include <stdio.h>

int main() {
    // Escribe un programa en C que calcule la suma de todos los elementos en un array de enteros
    int suma=0;
    int cadena[5]={6,7,4,3,10};
    for (int i = 0; i < 5; i++){
        suma+=cadena[i];
        printf("vamos %i\n",suma);
    }

    return 0;
}