#include <stdio.h>

int encontrarMenor(int, int, int);

int main() {
    int a, b, c; 
    int r;

    printf("ingrese el primer numero:\n");
    scanf("%i", &a);
    printf("ingrese el segundo numero:\n");
    scanf("%i", &b);
    printf("ingrese el tercer numero:\n");
    scanf("%i", &c);

    r=encontrarMenor(a,b,c);

    printf("el menor es: %i",r);
    return 0;
}
int encontrarMenor(int a,int b,int c) {
    if (a<=b && a<=c){
        return a;
    }else if (b<=a && b<=c){
        return b;
    }else{
        return c;
    }    
}