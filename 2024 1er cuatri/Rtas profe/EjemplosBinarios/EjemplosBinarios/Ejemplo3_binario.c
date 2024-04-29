//ejemplo 3
#include <stdio.h>
int main(){
    int num, nReg;
    FILE *pArchivo;
    pArchivo=fopen("guardar_numeros.dat","ab");
    if(pArchivo!=NULL){
        do{
        printf("Ingrese un numero de dni, para terminar 0 (cero): ");
        scanf("%d",&num);
        if(num!=0)
            fwrite(&num,sizeof(int),1,pArchivo);
        }while (num > 0);
        fclose(pArchivo);
        }
    else{printf("Error en la apertura del archivo");}
    getchar();
    return 0;
}

