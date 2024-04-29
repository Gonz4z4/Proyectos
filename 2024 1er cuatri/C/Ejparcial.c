#include <stdio.h>
#include <stdlib.h>
#include <string.h>

    struct notebooks{
    int codigo_maquina;
    char nombre_prestado[20];
    long int dni;
    char fecha_prestamo[12]; //25-06-2024
    char fecha_expiracion[12]; //30-06-2024
    float valor_asegurado;
};
void cargarDatos(struct notebooks **inventario,int *cantidad);
void imprimirDatos(struct notebooks *inventario,int cantidad);
void modificarDatos();
void recargarDatos();
void eliminarDatos();
void guardarTexto();
void guardarBinario();
void cargarBinario();

int main() {
    struct notebooks *inventario=NULL;
    int cantidad=0, select=1;
    do{
        printf("Menu:\n");
        printf("1)Cargar datos:\n");
        printf("2)Imprimir datos:\n");
        printf("0)Salir:\n");

        scanf("%i",&select);
        switch (select){
        case 1: //cargar datos en vector dinamico
            char continuar;
            do{
                cargarDatos(&inventario, &cantidad);
                printf("desea ingresar otra notebook?(s o n)\n");
                fflush(stdin);
                scanf("%c",&continuar);
            } while(continuar!='n' && continuar!='N');
            break;
        case 2: //imprime los elementos del vector hermosamente
                imprimirDatos(inventario, cantidad);
        
            break;
        case 3: //modificacion fecha con DNI
            
            break;
        case 4: //modificacion todos los datos con codigo de maquina
            
            break;
        case 5: //mostrar elementos del vector, su posicion en el vector y permitir eliminar con ese num
            
            break;
        case 6: //guardar elementos en notebook.txt
            
            break;
        case 7: //guardar elementos en notebook.dat
            
            break;
        case 8: //cargar elementos desde notebook.dat
            
            break;
        case 0: //salir
            
            break;
        default:
            printf("ingrese un número válido\n");
            break;
        }
        
    } while (select!=0);
    printf("Nos vemos!\n");
    
    free(inventario); // Liberar memoria din�mica antes de salir
return 0;
}
void cargarDatos(struct notebooks **inventario,int *cantidad){
    (*cantidad)++;
    *inventario=(struct notebooks*) realloc(*inventario,*cantidad * sizeof(struct notebooks)); 
    //Aca le estoy pasando el puntero que apunta a la direccion de memoria de notebooks para que le asigne un espacio
        printf("Ingrese los datos para la notebook %i\n",*cantidad);
        printf("Codigo de maquina:\n");
        scanf("%i", &((*inventario)[*cantidad-1].codigo_maquina));
        //aca estoy apuntando con un scan a la direccion de memoria de *inventario, que es a que apunta a inventario
        printf("Nombre:\n");
        scanf("%s", (*inventario)[*cantidad-1].nombre_prestado);
        printf("DNI:\n");
        scanf("%ld", &((*inventario)[*cantidad-1].dni));
        printf("fecha prestamo (dd-mm-aaaa):\n");
        scanf("%s", (*inventario)[*cantidad-1].fecha_prestamo);
        printf("fecha expiracion (dd-mm-aaaa):\n");
        scanf("%s", (*inventario)[*cantidad-1].fecha_expiracion);
        printf("valor asegurado:\n");
        scanf("%f", &((*inventario)[*cantidad-1].valor_asegurado));
}
void imprimirDatos(struct notebooks *inventario,int cantidad){
    for (int i = 0; i < cantidad; i++){
        printf("NOTEBOOK %i\n",cantidad);
        printf("Codigo maquina: %i\n",inventario[cantidad-1].codigo_maquina);
        printf("nombre_prestado: %s\n",inventario[cantidad-1].nombre_prestado);
        printf("dni %ld\n",inventario[cantidad-1].dni);
        printf("fecha_prestamo %s\n",inventario[cantidad-1].fecha_prestamo);
        printf("fecha_expiracion: %s\n",inventario[cantidad-1].fecha_expiracion);
        printf("Valor asegurado: %f\n",inventario[cantidad-1].valor_asegurado);
    }
}