//5! (se lee "factorial de cinco") es igual al producto 5.4.3.2.1. De manera similar, 8! = 8.7.6.5.4.3.2.1.
//Escribe un programa que calcule el factorial de un número que se ingresa por teclado
//(ten en cuenta el tipo de dato para obtener el resultado).
#include<stdio.h>

int main(){
    int num, factorial;
    factorial=1;
    printf("Introduzca numero\n");
    scanf("%i", &num);
    for (num; num>0 ; num--)
    factorial = num*factorial;
    printf("El factorial del numero es = %i", factorial);

getchar();
return 0;
}
