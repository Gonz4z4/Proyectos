//ejemplo 2
#include <stdio.h>
int main(){
int num;
FILE *pArchivo;

pArchivo=fopen("guardar_numeros.dat","rb");

if(pArchivo!=NULL){
    fread(&num,sizeof(int),1,pArchivo);
    while(!feof(pArchivo)){
        printf("%d\n", num);
        fread(&num,sizeof(int),1,pArchivo);
    }
    fclose(pArchivo);
}
else{printf("Error en la apertura del archivo");}
getchar();
return 0;
}
