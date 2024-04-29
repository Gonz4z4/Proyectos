#include <stdio.h>
#include <string.h>
#define maxCiud 10
struct ciudad{
    char nombre[50];
    int poblacion;
    char pais [50];
};
void cargar(struct ciudad ciudades[], int *numciud);
void imprimir(struct ciudad ciudades[], int numciud);
void agregar(struct ciudad ciudades[], int *numciud);
void quitar(struct ciudad ciudades[], int *numciud);

int main() {
    int selec=1, numciud=0;
    struct ciudad ciudades[maxCiud];
    while (selec!=0){
        printf("Seleccione una opcion:\n1)Cargar ciudades\n2)Imprimir ciudades\n3)agregar ciudades\n4)quitar ciudades\n0)Finalizar el programa\n");
        scanf("%i",&selec);
        switch (selec){
            case 1:
                cargar(ciudades,&numciud);
                break;
            case 2:
                imprimir(ciudades,numciud);
                break;
            case 3:
                if(numciud!=0){
                agregar(ciudades,&numciud);
                } else{
                    printf("No hay ciudades para cambiar!\n");
                }
                break;
            case 4:
                if(numciud!=0){
                quitar(ciudades,&numciud);
                } else{
                    printf("No hay ciudades para quitar!\n");
                }
                break;
            case 0:
                break;
            default:
                printf("Ingrese un numero valido por favor! :3\n");
                break;
        }
    
    }  
    printf("Hasta la proxima!!\n");
return 0;
}

void cargar(struct ciudad ciudades[], int *numciud){
    char respuesta;
    do{
        printf("Ingrese el nombre de la ciudad numero: %i\n",*numciud);
        scanf("%s", ciudades[*numciud].nombre); //por alguna razon para los string no tengo que poner &
        printf("Ingrese la poblacion\n");
        scanf("%i", &ciudades[*numciud].poblacion);
        printf("Ingrese el pais\n");
        scanf("%s", ciudades[*numciud].pais);
        fflush(stdin);

        (*numciud)++;

        printf("Desea ingresar otra ciudad?(S/N):");
        fflush(stdin);
        scanf(" %c", &respuesta);
    } while (respuesta == 'S' || respuesta == 's');
}

void imprimir(struct ciudad ciudades[], int numciud){
    for (int i = 0; i < numciud; i++){
        printf("CIUDAD NUM: %i\n", i+1);
        printf("-Nombre: %s\n", ciudades[i].nombre);
        printf("-Poblacion: %i\n", ciudades[i].poblacion);
        printf("-Pais: %s\n", ciudades[i].pais);

    }
    
}

void agregar(struct ciudad ciudades[], int *numciud){
    int nuevonum=0;
    do{
    printf("Ingrese cual es el numero de la ciudad a agregar:\n(cuidado, esto va a sobreescribir ciudades)\n");
    scanf("%i", &nuevonum);
    }while (nuevonum>*numciud);
    printf("Ingrese el nombre de la ciudad numero: %i\n",nuevonum);
    scanf("%s", ciudades[nuevonum].nombre); //por alguna razon para los string no tengo que poner &
    printf("Ingrese la poblacion\n");
    scanf("%i", &ciudades[nuevonum].poblacion);
    printf("Ingrese el pais\n");
    scanf("%s", ciudades[nuevonum].pais);
    fflush(stdin);    
}
void quitar(struct ciudad ciudades[], int *numciud){
    char nombreEliminar[50];
    int indiceEliminar = -1;

    printf("\nIngrese el nombre de la ciudad que desea eliminar: ");
    scanf("%s", nombreEliminar);

    for (int i = 0; i < *numciud; i++){
        if(strcmp(nombreEliminar,ciudades[i].nombre)==0){
        indiceEliminar=i;
        }
    }
    if (indiceEliminar!=-1){
        for (int i = indiceEliminar; i < *numciud - 1; i++) {
            strcpy(ciudades[i].nombre, ciudades[i + 1].nombre);
            ciudades[i].poblacion = ciudades[i + 1].poblacion;
            strcpy(ciudades[i].pais,ciudades[i+1].pais);
        }
        (*numciud)--;
        printf("La ciudad fue erradicada de la existencia\n");
    }else{
        printf("Esa ciudad no existe\n");
    }
    
}