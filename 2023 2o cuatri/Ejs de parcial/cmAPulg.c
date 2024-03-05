#include <math.h>

int main(){
    float cent, pulg; //declarar la variable
    int pies;
    printf("ingrese la cantidad de centimetros\n"); //pedir al usuario
    scanf("%f",&cent); //ingreso del usuario
    printf("la cantidad de centimetros es %f \n", cent); //contarle al usuario que es lo que puso
    pulg= 0.393701*cent;
    pies= 0.0328084*cent;
    printf("la cantidad de pulgadas es %.2f y de pies es %i\n", pulg, pies);
    printf("%.1f cm -> %.1f pulgadas\n",cent,pulg);
    printf("%.1f cm -> %i pies",cent,pies);
}
