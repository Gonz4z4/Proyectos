/*
Escribe un programa que permita calificar a un grupo de 10 alumnos
de la escuela secundaria. Por teclado se ingresan el nombre y las
tres calificaciones de cada alumno y con esos datos el programa debe
calcular e informar el promedio de cada alumno y decir si está aprobado
o no; para aprobar se requiere un promedio de seis o más y haber
obtenido al menos seis en la última de las tres calificaciones.
Posteriormente el programa debe informar cuántos alumnos aprobaron y
cuántos obtuvieron un promedio de al menos 8 puntos.
*/

#include <stdio.h>

int main(){ /* la función main comienza la ejecución del programa */
    float nota1,nota2,nota3;
    char nombre[100];
    int aprobados = 0, nashe = 0;

    int i; /* contador */
    for ( i = 0; i < 10; i++ ){    /* repite el ciclo 10 veces */
    printf("Ingrese el nombre del alumno:\n");
    scanf("%s",nombre);
    printf("Ingrese la primera calificacion del alumno (1-10):\n");
    scanf("%f",&nota1);
    printf("Ingrese la segunda calificacion del alumno (1-10):\n");
    scanf("%f",&nota2);
    printf("Ingrese la tercera calificacion del alumno (1-10):\n");
    scanf("%f",&nota3);

    float prom = (nota1+nota2+nota3)/3.0;

    if (prom>=8){
        printf("%s esta de nashei con un promedio de %.2f\n",nombre,prom);
        nashe++;
    }
    else if (prom>=6){
        printf("%s esta aprobado con un promedio de %.2f\n",nombre,prom);
        aprobados++;
    }
    else{
        printf("%s esta desaprobado jaja con un promedio de %.2f\n",nombre,prom);}

    } /* fin de for */

    printf("Numero de aprobados: %i\n",aprobados+nashe);
    printf("Numero de capos nashe: %i",nashe);

   getchar();
   return 0; /* indica la terminación exitosa del programa */
} /* fin de la función main */
