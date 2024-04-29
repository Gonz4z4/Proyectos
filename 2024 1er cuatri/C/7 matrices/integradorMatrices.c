#include <stdio.h>
void ingreso(int *fila,int *columna,int matriz[][*columna]){
    for (int i = 0; i < *fila; i++){
            for (int j = 0; j < *columna; j++){
                printf("Ingrese la %ia nota del alumno %i:\n",j+1,i+1);
                scanf("%i", &matriz[i][j]);
            }
        }
}
void egreso(int *fila,int *columna,int matriz[][*columna]){
    for (int i = 0; i < *fila; i++){
        for (int j = 0; j < *columna; j++){
            printf("La %ia nota del alumno: %i es: %i\n",j+1,i+1,matriz[i][j]);
        }
    }
}
void promedio(int *fila,int *columna,int matriz[][*columna]){
    float promedio;
    for (int i = 0; i < *fila; i++){
        float suma=0;
            for (int j = 0; j < *columna; j++){
                suma+=matriz[i][j];
            }
        promedio=suma/ *columna;
        printf("el promedio del alumno %i es: %.2f\n",i+1, promedio);
        }
}
int main() {
    int fila, columna;
    printf("ingrese la cantidad de alumnos a ingresar:\n");
    scanf("%i",&fila);
    printf("ingrese la cantidad de notas por alumno:\n");
    scanf("%i",&columna);
    int matriz[fila][columna];

    ingreso(&fila,&columna,matriz);

    /*egreso(&fila,&columna,matriz);*/

    promedio(&fila,&columna,matriz);

    return 0;
}