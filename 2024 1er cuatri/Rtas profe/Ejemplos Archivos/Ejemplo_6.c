//ejemplo6
#include <stdio.h>
void leerArch(FILE * pA, char * nom){
    char c;
    pA=fopen(nom,"r");
    if(pA != NULL){
        while( c != EOF) {
            c = fgetc(pA);
            printf("%c", c);// o putchar(c);
        }
        fclose(pA);
    }else {
        printf("Error en la apertura del archivo!");}
    }
int main(){

    FILE * pArchivo;
    char nombreArch[30] = "texto.txt";

    leerArch(pArchivo, nombreArch);
    getchar();

    return 0;
}
