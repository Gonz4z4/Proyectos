#include <stdio.h>
#define dim 11
int main(){
    char cadena[dim];
    int cont=0;
    while (cadena[cont] != '\0'){ //tiene que terminar en caracter nulo
        printf( "Ingrese una letra de su cadena: \n" );
        scanf( "%c", &cadena[cont] );
        getchar(); 
        fflush(stdin);
        cont++;
    }
    printf ("Mi cadena es: %s\n", cadena);
    printf ("contador lleg%c a: %d\n", 162, cont);
    return 0;
}
