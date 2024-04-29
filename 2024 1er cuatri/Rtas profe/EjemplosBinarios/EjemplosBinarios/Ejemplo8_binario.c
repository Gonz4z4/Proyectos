//ejemplo 8
#include <stdio.h>
struct persona{
    long int dni;
    char ape[20];
    float alt;
};
int main(){
    struct persona unapersona;
    FILE *pArchivo;
    pArchivo=fopen("datos_personas.dat","rb");
    if(pArchivo!=NULL){
        fread(&unapersona,sizeof(struct persona),1,pArchivo);
        while(!feof(pArchivo)){
            printf("%d - %10s - %5.2f\n",unapersona.dni,unapersona.ape,unapersona.alt);
            fread(&unapersona,sizeof(struct persona),1,pArchivo);
        }
        fclose(pArchivo);
    }
    else{printf("Error en la apertura del archivo");}
    getchar();
return 0;
}
