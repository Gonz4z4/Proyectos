//ejemplo 8
#include <stdio.h>
void leerArch(FILE * pA, char * nom){
    char linea[200];

    pA=fopen(nom,"r");

    if(pA != NULL){
    fgets(linea,200,pA); //carga una línea
        while(!feof(pA)){
            printf("%s", linea);
            fgets(linea,200,pA);
    }
    fclose(pA);
    }
    else { printf("Error en la apertura del archivo!");}
}
int main(){
    FILE * pArchivo;
    char nombreArch[30] = "textolargo.txt";

    leerArch(pArchivo, nombreArch);
    getchar();
    return 0;
}
