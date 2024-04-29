//ejemplo 9
#include <stdio.h>
struct persona{
    long int dni;
    char ape[20];
    float alt;
};
int main(){
    struct persona unapersona;
    FILE *pArchivo;

    pArchivo=fopen("datos_personas.dat","ab");

    if(pArchivo!=NULL){
        printf("Ingrese un numero, para terminar 0 (cero): ");
        scanf("%d",&unapersona.dni);
        fflush(stdin);
        while(unapersona.dni > 0){
            printf("Ingrese un apellido: ");
            scanf("%s",unapersona.ape);
            fflush(stdin);
            printf("Ingrese la altura: ");
            scanf("%f",&unapersona.alt);
            fflush(stdin);
            fwrite(&unapersona,sizeof(struct persona),1,pArchivo);
            printf("Ingrese un numero, para terminar 0 (cero): ");
            scanf("%d",&unapersona.dni);
            fflush(stdin);
        }
        fclose(pArchivo);
        }
    else{printf("Error en la apertura del archivo");}
    getchar();
    return 0;
    }
