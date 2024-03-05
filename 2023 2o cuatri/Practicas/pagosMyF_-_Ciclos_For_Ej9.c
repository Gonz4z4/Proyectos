/*
Escribe un programa de sueldos para una pequeña compañía que tiene 6 empleados.
Para cada empleado/a, el programa recibe desde el teclado el nombre, sexo, horas
trabajadas y sueldo por hora. Por cada empleado ingresado, el programa deberá mostrar
en pantalla el nombre y el sueldo de cada empleado. Posteriormente debe informar el
total de pagos para cada sexo, y el sueldo promedio de hombres y de mujeres.
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(){

    int pagosM = 0, pagosF = 0;
    float totalM = 0,totalF = 0;

    int i;
    for(i=1; i<=6; i++){
        char empleado[100];
        char sexo;
        float horas;
        float sueldo;

        printf("Ingrese el nombre del empleado:\n");
        scanf("%s",&empleado);
        printf("Ingrese el sexo del empleado (M/F):\n");
        scanf(" %c",&sexo);
        printf("Ingrese el total de horas trabajdas:\n");
        scanf("%f",&horas);
        printf("Ingrese el sueldo por hora trabajada:\n");
        scanf("%f",&sueldo);

        float prom = horas*sueldo;
        printf("%s: %.2f \n \n",empleado,prom);

        if ((sexo=='M') || (sexo=='m')){
            pagosM++;
            totalM+=prom;}
        else if ((sexo=='F') || (sexo=='f')){
            pagosF++;
            totalF+=prom;}

    }

    float promM = totalM/pagosM;
    float promF = totalF/pagosF;
    /*
    if (totalF == 0)
        pagosF++;
    if (totalM == 0)
        pagosM++;
    */
    printf("El promedio de sueldos de hombres es: $%.2f \n",promM);
    printf("El total de pagos a hombres es: %i \n",pagosM);
    printf("El promedio de sueldos de mujeres es: $%.2f \n",promF);
    printf("El total de pagos a mujeres es: %i \n",pagosF);
}
