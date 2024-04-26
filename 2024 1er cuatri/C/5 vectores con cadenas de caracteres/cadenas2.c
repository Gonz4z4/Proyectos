#include <stdio.h>
#define dim 11
int main(){
    char cadena[dim];
    printf( "Ingrese una cadena: \n" );
    scanf( "%s", cadena); //solo funciona hasta espacio
    fflush(stdin); 
    printf ("Mi cadena es: %s\n", cadena);
    return 0;
}