//ejemplo 5
#include <stdio.h>
int main(){
    int num, nReg;
    FILE *pArchivo;

    pArchivo=fopen("guardar_numeros.dat","r+b");
    if(pArchivo!=NULL){
        fseek(pArchivo,0,SEEK_END);
        nReg=ftell(pArchivo)/sizeof(int);
        printf("Numero de registros en el archivo = %d\n",nReg);
        fseek(pArchivo,0,SEEK_SET);
        fseek(pArchivo,2*sizeof(int),SEEK_SET);
        fread(&num,sizeof(int),1,pArchivo);
        printf("3er valor: %d\n",num);
        fclose(pArchivo);
    }
    else{printf("Error en la apertura del archivo");}
    getchar();
    return 0;
}

