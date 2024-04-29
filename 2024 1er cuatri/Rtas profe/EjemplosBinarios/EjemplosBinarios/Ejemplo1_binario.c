//ejemplo 1
#include <stdio.h>
int main(){
int num;
FILE *pArchivo;

pArchivo=fopen("guardar_numeros.dat","wb");

if(pArchivo!=NULL){
    do{
        printf("Ingrese un numero de dni, para terminar 0 (cero):");
        scanf("%d",&num);
        fflush(stdin);
        if(num!=0)
            fwrite(&num,sizeof(int),1,pArchivo);
    }while (num > 0);
    fclose(pArchivo);
}else{printf("Error en la apertura del archivo");}
    getchar();
return 0;
}
