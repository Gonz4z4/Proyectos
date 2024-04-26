#include <stdio.h>

int main() {
    //vector con numeritos
    int vector[]={1,4,5,2,5,34};
    int longitud=sizeof(vector)/sizeof(vector[0]);
    printf("longitud=%i\n",longitud);
    for (int i = 0; i < longitud; i++){
        printf("%i ",vector[i]);
    }

    //vector con letras (o string)
    char cadena[]= {'s','e','x','o','o'};
    int longitud2=sizeof(cadena)/sizeof(cadena[0]);
    for (int i = 0; i < longitud2; i++){
        printf("%c",cadena[i]);
    }

    //vector a rellenar por el usuario
return 0;
}