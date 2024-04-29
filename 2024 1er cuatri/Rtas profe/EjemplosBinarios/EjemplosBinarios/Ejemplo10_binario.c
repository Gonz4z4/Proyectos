//ejemplo 10
#include <stdio.h>
struct persona{
    long int dni;
    char ape[20];
    float alt;
};
int main(){
    struct persona unapersona;
    FILE *pArchivo;
    int registro, nReg;
    char apenuevo[20];

    pArchivo=fopen("datos_personas.dat","r+b");
    if(pArchivo!=NULL){
        fseek(pArchivo,0,SEEK_END);
        nReg=ftell(pArchivo)/sizeof(struct persona);
        printf("Numero de elementos en el archivo =%d\n",nReg);
        printf("Ingrese el número de elemento que quiere modificar: ");
        scanf("%d",&registro); //ingreso 5
        fseek(pArchivo,0,SEEK_SET);
        fseek(pArchivo,(registro-1)*sizeof(struct persona),SEEK_SET);
        fread(&unapersona,sizeof(struct persona),1,pArchivo);
        printf("%d %10s %10.2f\n",unapersona.dni,unapersona.ape,unapersona.alt);
        printf("Ingrese el apellido nuevo:\n");
        scanf("%s",apenuevo);
        fflush(stdin);
        strcpy(unapersona.ape, apenuevo);
        fseek(pArchivo,-sizeof(struct persona),SEEK_CUR);
        fwrite(&unapersona,sizeof(struct persona),1,pArchivo);
        fclose(pArchivo);
    }
    else { printf("Error en la apertura del archivo");}
    getchar();
    return 0;
}
