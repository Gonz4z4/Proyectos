//ejemplo 6
#include <stdio.h>
int main(){
    int num, valor, nReg;
    FILE *pArchivo;

    pArchivo=fopen("guardar_numeros.dat","r+b");

    if(pArchivo!=NULL){
        printf("Ingrese un valor\n");
        scanf("%d", &valor);
        fseek(pArchivo,0,SEEK_SET);
        fseek(pArchivo,2*sizeof(int),SEEK_CUR);
        fread(&num,sizeof(int),1,pArchivo);
        num=valor;
        fseek(pArchivo, - sizeof(int),SEEK_CUR);
        fwrite(&num,sizeof(int),1,pArchivo);
        printf("3er valor: %d\n",num);
        fclose(pArchivo);
    }
    else printf("Error en la apertura del archivo");
    getchar();
    return 0;
    }
