#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char div, divMay;
    int totLegajo=0, seguir, anioMay;
    float promMay=0;

    for(int anio = 1; anio <= 7; anio++){
        printf("GRADO: %i\n------------------\n", anio);
        int contA=0, contB=0;
        float nota=0, notaA=0, notaB=0, promA=0, promB=0;
        seguir=1;

        while(seguir!=0){

            printf("\nIngrese division (A/B): ");
            scanf(" %c", &div);
            printf("Ingrese la nota del alumno (1-10): ");
            scanf(" %f",&nota);
            if(div=='A'){
                notaA+=nota;
                contA++;
            }else if (div=='B'){
                notaB+=nota;
                contB++;
            }
            printf("Desea terminar? (0=SI, 1=NO): ");
            scanf(" %i", &seguir);
        }

        promA=notaA/contA;
        promB=notaB/contB;
        printf("\n***********************\nPROMEDIO %iA: %.2f\n", anio, promA);
        printf("PROMEDIO %iB: %.2f\n***********************\n\n", anio, promB);
        totLegajo+=contA+contB;
        if (promMay<promA){
            promMay=promA;
            anioMay=anio;
            divMay='A';
        }
        if(promMay<promB){
            promMay=promB;
            anioMay=anio;
            divMay='B';
        }
    }
        printf("\nel mayor promedio ha sido %.2f de %i grado division %c\n",promMay, anioMay, divMay);
        printf("la cantidad de legajos cargados fue de %i\n",totLegajo);
}

