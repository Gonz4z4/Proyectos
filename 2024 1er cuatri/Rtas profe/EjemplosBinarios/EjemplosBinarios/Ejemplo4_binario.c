//ejemplo 4
#include <stdio.h>
int main(){
    int num, nReg;
    FILE *pArchivo;
    pArchivo=fopen("guardar_numeros.dat","r+b");
    if(pArchivo!=NULL){
        fseek(pArchivo,0,SEEK_END);
        nReg=ftell(pArchivo)/sizeof(int);
        printf("Numero de elementos en el archivo = %d\n",nReg);
        fclose(pArchivo);
    }
    else{printf("Error en la apertura del archivo");}
    getchar();
return 0;}
