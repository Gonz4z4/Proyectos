#include <stdio.h>

int main() {
    int num1, num2;
    int *p1=&num1, *p2=&num2;
    printf("ingrese dos numeros:");
    scanf("%i",p1);
    scanf("%i",p2);
    if (*p1>*p2){
        printf("el numero mayor es %i", num1);
    }else{  
        printf("el numero mayor es %i", num2);
    }
    return 0;
}