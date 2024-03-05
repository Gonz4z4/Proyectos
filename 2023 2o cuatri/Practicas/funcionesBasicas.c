#include <stdio.h>
#include <math.h>

int main(){
    printf("hola mundo");
    printf("\nesto sirve para bajar una linea\n");
    /*no te olvides de poner ; gonza lpm*/
    // esto es un comentador de linea
    double num1; //declarar la variable
    scanf("%d", &num1); //scanf ("%i (le aviso a la compu que lo que va a llegar es un entero)
                        //&num1 (le aviso a la pc que lo que llega lo tiene que guardar aca )
    if (num1>10){
        printf("%d es num1! y mayor a 10!",num1);
    }else if(num1<10){
        printf("%d es num1! y menor a 10", num1);
    }else {
        printf("tu numero es 10");
    }
    return 0;
}
