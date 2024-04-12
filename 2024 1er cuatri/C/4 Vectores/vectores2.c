#include <stdio.h>

int main() {
    // Escribe un programa en C que encuentre y muestre el maximo elemento en un array de enteros.
    int max=0;
    int cadena[5]={6,7,50,3,10};
    for (int i = 0; i < 5; i++){
        if (max<cadena[i]){
            max=cadena[i];
        }
    }
    printf("el mayor numero de la cadena es: %i\n",max);
    return 0;
}
