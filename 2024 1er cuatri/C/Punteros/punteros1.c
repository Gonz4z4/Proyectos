#include <stdio.h>
int main(){
    int a, b; 
    int *p1=&a,*p2=&b, temp;

    printf("ingrese dos numeros\n");
    scanf("%i", p1);
    scanf("%i", p2);
    printf("a es %i,b es %i\n",*p1,*p2);

    temp=*p1;
    *p1=*p2;
    *p2=temp;

    printf("p1 es %i,p2 es %i\n",*p1,*p2);
    printf("a es %i,b es %i\n",a,b);
}