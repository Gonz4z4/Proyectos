//ejemplo 2
#include <stdio.h>
int main(){
char palabra[31];
FILE * pArchivo; //declara un archivo
FILE * gay;
pArchivo = fopen("un_archivo.txt","w"); // abre un archivo en modo escritura (w)
gay=fopen("gay.txt","w");

if(gay !=NULL){
    printf("ingrese un par de palabras:\n");
    gets(palabra);
    fflush(stdin);
    fputs(palabra,gay);
    fclose(gay);
}else printf("Error en la apertura del archivo!");

if(pArchivo != NULL){
    printf("Ingrese una oraci�n hasta 30 caracteres: \n");
    scanf("%s",palabra);
    fflush(stdin);
    fputs(palabra, pArchivo);
    fclose(pArchivo);
}
else printf("Error en la apertura del archivo!");
getchar();
return 0;
}
