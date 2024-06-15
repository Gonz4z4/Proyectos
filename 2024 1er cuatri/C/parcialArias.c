#include <string.h>
#include <stdlib.h>
#include <stdio.h>

struct farmaco {
    int codigo_producto;
    char nombre[50];
    float precio;
    int cantidad_disponible;
    int cantidad_vendida;
};
void cargarFarmacos(struct farmaco **inventario, int *cantidad);
void mostrarFarmacos(struct farmaco *inventario, int cantidad);
void modificarParametros(struct farmaco *inventario, int cantidad, char nombre);
void eliminarFarmacos(struct farmaco **inventario, int *cantidad);
void txtDistribuidora(struct farmaco *inventario, int cantidad);
void masVendido(struct farmaco *inventario, int cantidad);
void ganancias(struct farmaco *inventario, int cantidad);


int main(){
    int cantidad;
    struct farmaco *inventario=NULL;
    int select;
    int fin=1;

    do{
        printf("Ingrese un numero del menu: \n");
        printf("1) Ingresar farmacos\n");
        printf("2) Mostrar farmacos\n");
        printf("3) Modificar (Por nombre)\n");
        printf("4) Venta producto NO IMPLEMENTADO\n");
        printf("5) Total de dinero recaudado en ventas\n");
        printf("6) Mostrar farmacos y eliminar\n");
        printf("7) Mostrar farmaco mas vendido\n");
        printf("8) Generar txt de productos que falltan\n");
        printf("9) Guardar a dat NO IMPLEMENTADO\n");
        printf("10) Abrirr desde datNO IMPLEMENTADO\n");
        printf("0) Salir\n");
        scanf("%i",&select);

        switch(select){
            case 1:
                do{
                    cargarFarmacos(&inventario,&cantidad);
                    printf("Desea continuar? 1)SI 0)NO\n");
                    scanf("%i", &fin);
                }while (fin!=0);
                break;
            case 2:
                mostrarFarmacos(inventario,cantidad);

                break;
            case 3:
                char nombre[50];
                printf("Ingrese nombre del producto a seleccionar");
                scanf("%s", nombre);
                modificarParametros(inventario, cantidad, nombre);
                break;
            case 4:

                break;
            case 5:
                ganancias(inventario,cantidad);
                break;
            case 6:
                eliminarFarmacos(&inventario, &cantidad);
                break;
            case 7:
                masVendido(inventario,cantidad);

                break;
            case 8:
                txtDistribuidora(inventario, cantidad);

                break;
            case 9:

                break;
            case 0:

                break;
            default:
                printf("Ingrese un numero valido!\n");
        }
    }while(select!=0);
    printf("Hasta la proxima!\n");
    free(inventario);

}

void cargarFarmacos(struct farmaco **inventario, int *cantidad){
    *cantidad+= 1;
    *inventario= (struct farmaco*)realloc(*inventario, *cantidad * sizeof(struct farmaco));
    printf("Ingrese datos del farmaco numero %i:\n",*cantidad);
    printf("Ingrese el codigo del producto\n");
    scanf("%i",&((*inventario)[*cantidad-1].codigo_producto));
    printf("Ingrese el nombre\n");
    scanf("%s",(*inventario)[*cantidad-1].nombre);
    printf("Ingrese el precio\n");
    scanf("%f",&((*inventario)[*cantidad-1].precio));
    printf("Ingrese cantidad disponible\n");
    scanf("%i",&((*inventario)[*cantidad-1].cantidad_disponible));
    printf("Ingrese la cantidad vendida\n");
    scanf("%i",&((*inventario)[*cantidad-1].cantidad_vendida));
}

void mostrarFarmacos(struct farmaco *inventario, int cantidad){
    printf("Hay %i productos\n",cantidad);
    for(int i=0; i<cantidad ;i++){
        printf("PRODUCTO %i\n",i+1);
        printf("-Codigo: %i\n",inventario[i].codigo_producto);
        printf("-Nombre: %s\n",inventario[i].nombre);
        printf("-Precio: %f\n",inventario[i].precio);
        printf("-Cantidad disponible: %i\n",inventario[i].cantidad_disponible);
        printf("-Cantidad vendida: %i\n",inventario[i].cantidad_vendida);

    }
}
void modificarParametros(struct farmaco *inventario, int cantidad, char nombre) {
    for (int i = 0; i < cantidad; ++i) {
        if (strcmp(inventario[i].nombre, nombre)==0) {
            printf("Ingrese nuevos datos para el producto %i:\n", i);
            printf("Precio:");
            scanf("%f", &inventario[i].precio);
            printf("Cantiddad disponible: ");
            scanf("%i", &inventario[i].cantidad_disponible);
            printf("Cantidad vendida: ");
            scanf("%i", &inventario[i].cantidad_vendida);
            return;
        }
    }
    printf("No se encontro el producto\n");
}
void eliminarFarmacos(struct farmaco **inventario, int *cantidad){
    int posicion;
    if (*cantidad == 0) {
        printf("no se ingresaron farmacos");
        return;
    }
    printf("Hay %i productos\n",*cantidad);
    for(int i=0; i<*cantidad ;i++){
        printf("POSICION %i\n",i+1);
        printf("-Codigo: %i\n",(*inventario)[i].codigo_producto);
        printf("-Nombre: %s\n",(*inventario)[i].nombre);
        printf("-Precio: %f\n",(*inventario)[i].precio);
        printf("-Cantidad disponible: %i\n",(*inventario)[i].cantidad_disponible);
        printf("-Cantidad vendida: %i\n",(*inventario)[i].cantidad_vendida);
    }
    printf("Posicion de la entrada a eliminar: ");
    scanf("%d", &posicion);

    for (int i = posicion - 1; i < *cantidad - 1; ++i) {
        (*inventario)[i] = (*inventario)[i + 1];
    }
    (*cantidad)--;
    *inventario = (struct farmaco*)realloc(*inventario, *cantidad * sizeof(struct farmaco));
    printf("farmaco eliminado\n");
}
void txtDistribuidora(struct farmaco *inventario, int cantidad) {
    FILE *archivo = fopen("menosque5.txt", "w");
    if (archivo == NULL) {
        printf("Error al abrir el archivo.\n");
        return;
    }

    fprintf(archivo, "De los siguientes productos quedan menos de 5:");
    for(int i=0; i<cantidad ;i++){
        if(inventario[i].cantidad_disponible<5){
            fprintf(archivo,"PRODUCTO %i\n",i+1);
            fprintf(archivo,"-Codigo: %i\n",inventario[i].codigo_producto);
            fprintf(archivo,"-Nombre: %s\n",inventario[i].nombre);
            fprintf(archivo,"-Precio: %f\n",inventario[i].precio);
            fprintf(archivo,"-Cantidad disponible: %i\n",inventario[i].cantidad_disponible);
            fprintf(archivo,"-Cantidad vendida: %i\n",inventario[i].cantidad_vendida);
            }
    }
    fclose(archivo);
    printf("guardado en archivo!\n");
}
void masVendido(struct farmaco *inventario, int cantidad){
    int mayorVendida=0, posMayor;
    for(int i=0; i<cantidad ;i++){
        if(inventario[i].cantidad_vendida>mayorVendida){
            mayorVendida=inventario[i].cantidad_vendida;
            posMayor=i;
        }
    }
        printf("PRODUCTO %i\n",posMayor+1);
        printf("-Codigo: %i\n",inventario[posMayor].codigo_producto);
        printf("-Nombre: %s\n",inventario[posMayor].nombre);
        printf("-Precio: %f\n",inventario[posMayor].precio);
        printf("-Cantidad disponible: %i\n",inventario[posMayor].cantidad_disponible);
        printf("-Cantidad vendida: %i\n",inventario[posMayor].cantidad_vendida);

}
void ganancias(struct farmaco *inventario, int cantidad){
    int multi, ganancias=0;
    for(int i=0; i<cantidad ;i++){
        multi= inventario[i].precio * inventario[i].cantidad_vendida;
        ganancias+= multi;
        }
        printf("Las ganancias totales son %i\n", ganancias);
}
