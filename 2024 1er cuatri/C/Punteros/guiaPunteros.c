#include <stdio.h>
int main(){
    int a=100;
    int *p=&a; //hago que el puntero apunte a a
    printf("%p\n",p); //imprimo el puntero
    printf("%i\n",*p); //desreferencia
    int b=200;
    void *pb=&b;
    printf("%p\n",pb);
    printf("%i\n",*(int*)pb); // aca estoy primero desreferenciando y despues casteando con (int*)
    int **pp=&p; //puntero del puntero
    printf("%p\n",*pp); //aca le pido que me de el contenido del puntero del puntero, así que me da la dirección de p
    for (int i = 0; i < 3; i++)
    {
        p+=1;
        printf("%p\n",p); //como es un int avanza de a 4
    }
    
    }