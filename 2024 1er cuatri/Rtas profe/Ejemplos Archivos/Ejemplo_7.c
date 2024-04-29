//ejemplo6
#include <stdio.h>
void leerArch(FILE * pA, char * nom){
    char c;
    pA=fopen(nom,"r");
    if(pA != NULL){
        while( c != EOF) {
    //EOF (end-of-file) indica que no hay más información en el archivo
    //podrias usar while( ! feof ( pA ) )  !feof() permite el recorrido secuencial del archivo hasta que encuentre el indicador de final del mismo.
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
