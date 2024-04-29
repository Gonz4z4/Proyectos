//ejemplo 3
#include <stdio.h>
int main(){
char palabra[31];
FILE * pArchivo;

pArchivo = fopen("un_archivo.txt","w");

if(pArchivo != NULL){
        printf("Ingrese una oración hasta 30 caracteres: \n");
        gets(palabra);
        fflush(stdin);
        fputs(palabra, pArchivo);
    fclose(pArchivo);
}
else printf("Error en la apertura del archivo!");
getchar();
return 0;
}
