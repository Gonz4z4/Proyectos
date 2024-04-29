//ejemplo 9
#include <stdio.h>
void leerArch(FILE * pA, char * nom){
    int n;
    char nombre[30];
    float salario;

    pA = fopen(nom,"r");

    if(pA!=NULL){
        while(!feof(pA)){
            fscanf(pA,"%d%15s%15f\n", &n,nombre,&salario);
            printf("%d\t%s\t%.2lf\n",n,nombre,salario);
        }
        fclose(pA);
    }else{
        printf("Error en la apertura del archivo!");
    }
}
int main(){
    FILE * pArchivo;
    char nombreArch[30] = "empleados.txt";

    leerArch(pArchivo, nombreArch);
    getchar();
    return 0;
}
