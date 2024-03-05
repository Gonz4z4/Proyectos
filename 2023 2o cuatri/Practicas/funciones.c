#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int c;
void funcion1(){
    printf("\nhola mundo");
    }
void mayorA10(int num1){
    if(num1>10){
        printf("Ese numero es mayor a 10");
    }else if(num1==10){
        printf("Ese numero es 10");
    } else{
        printf("Ese numero es menor a 10");
    }
}
void sum(int num1, int num2){
    c=num1+num2;
    printf("%i", c);
}
int main(){
    printf("COMIENZO PROGRAMA\n ---------------------");
    funcion1();
    int num1, num2;
    printf("\nINGRESE UN NUMERO\n");
    scanf("%i", &num1);
    mayorA10(num1);
    printf("\nINGRESE UN NUMERO\n");
    scanf("%i", &num2);
    sum(num1,num2);
}
