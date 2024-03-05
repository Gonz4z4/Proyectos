//Desarrolla un algoritmo que le permita leer un valor radio (R), calcular el área (A) de un círculo y emitir valor.
#include<stdio.h>
#include<math.h>
int main(){
    int radio;
    float area,casiarea;
printf("Ingresar valor de radio\n", radio);
scanf("%i", &radio);
casiarea = radio*radio;
printf("casiarea es %f\n",casiarea);
area= casiarea*3.14;
printf("El area de su circulo es de %f", area);
}
