#include <stdio.h>

int main() {
    int num, digito, suma=0;
    int *p1=&num, *p2=&digito;
    
    printf("ingrese un numero para sumar sus digitos\n");
    scanf("%i", p1);
    
    do{
        *p2=*p1%10;
        *p1/=10;
        suma+=*p2;
    } while (num!=0);

    printf("la suma de sus digitos es %i",suma);
    
    return 0;
}