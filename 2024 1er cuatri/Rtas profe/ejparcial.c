#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Definici�n de la estructura
struct notebook {
    int codigo_maquina;
    char nombre_prestado[20];
    long int dni;
    char fecha_prestamo[12]; //25-06-2024
    char fecha_expiracion[12]; //30-06-2024
    float valor_asegurado;
};

// Prototipos de las funciones
void ingresarNotebooks(struct notebook **inventario, int *cantidad);
void imprimirNotebooks(struct notebook *inventario, int cantidad);
void modificarFechaExpiracion(struct notebook *inventario, int cantidad, long int dni);
void modificarParametros(struct notebook *inventario, int cantidad, int codigo_maquina);
void imprimirYEliminar(struct notebook **inventario, int *cantidad);
void imprimirEnArchivo(struct notebook *inventario, int cantidad);
void guardarEnArchivoBinario(struct notebook *inventario, int cantidad);
void cargarDesdeArchivoBinario(struct notebook **inventario, int *cantidad);

int main() {
    struct notebook *inventario = NULL;
    int cantidad = 0;
    int opcion;
    char opcion_ingresar;

    do {
        printf("\nMen�:\n");
        printf("1. Ingresar notebooks\n");
        printf("2. Imprimir notebooks\n");
        printf("3. Modificar fecha de expiraci�n\n");
        printf("4. Modificar par�metros por c�digo de m�quina\n");
        printf("5. Imprimir y eliminar\n");
        printf("6. Imprimir en archivo\n");
        printf("7. Guardar en archivo binario\n");
        printf("8. Cargar desde archivo binario\n");
        printf("9. Salir\n");
        printf("Ingrese opci�n: ");
        scanf("%d", &opcion);

        switch(opcion) {
            case 1:
                do{
                    ingresarNotebooks(&inventario, &cantidad);
                    printf("desea ingresar otra notebook?(s o n)\n");
                    fflush(stdin);
                    scanf("%c",&opcion_ingresar);
                }while(opcion_ingresar!='n' && opcion_ingresar!='N');
                break;
            case 2:
                imprimirNotebooks(inventario, cantidad);
                break;
            case 3: {
                long int dni;
                printf("Ingrese DNI: ");
                scanf("%ld", &dni);
                modificarFechaExpiracion(inventario, cantidad, dni);
                break;
            }
            case 4: {
                int codigo_maquina;
                printf("Ingrese c�digo de m�quina: ");
                scanf("%d", &codigo_maquina);
                modificarParametros(inventario, cantidad, codigo_maquina);
                break;
            }
            case 5:
                imprimirYEliminar(&inventario, &cantidad);
                break;
            case 6:
                imprimirEnArchivo(inventario, cantidad);
                break;
            case 7:
                guardarEnArchivoBinario(inventario, cantidad);
                break;
            case 8:
                cargarDesdeArchivoBinario(&inventario, &cantidad);
                break;
            case 9:
                printf("Saliendo del programa.\n");
                break;
            default:
                printf("Opci�n no v�lida. Int�ntelo de nuevo.\n");
        }
    } while (opcion != 9);

    free(inventario); // Liberar memoria din�mica antes de salir
    return 0;
}

void ingresarNotebooks(struct notebook **inventario, int *cantidad) {
    *cantidad += 1;
    *inventario = (struct notebook*)realloc(*inventario, *cantidad * sizeof(struct notebook));

    printf("Ingrese datos para la notebook %d:\n", *cantidad);
    printf("C�digo de m�quina: ");
    scanf("%d", &((*inventario)[*cantidad - 1].codigo_maquina));
    printf("Nombre prestado: ");
    scanf("%s", (*inventario)[*cantidad - 1].nombre_prestado);
    printf("DNI: ");
    scanf("%ld", &((*inventario)[*cantidad - 1].dni));
    printf("Fecha de pr�stamo (dd-mm-yyyy): ");
    scanf("%s", (*inventario)[*cantidad - 1].fecha_prestamo);
    printf("Fecha de expiraci�n (dd-mm-yyyy): ");
    scanf("%s", (*inventario)[*cantidad - 1].fecha_expiracion);
    printf("Valor asegurado: ");
    scanf("%f", &((*inventario)[*cantidad - 1].valor_asegurado));
}

void imprimirNotebooks(struct notebook *inventario, int cantidad) {
    printf("------ Inventario de Notebooks ------\n");
    printf("C�d.\tNombre\tDNI\tF. Pr�stamo\tF. Expiraci�n\tValor\n");
    for (int i = 0; i < cantidad; ++i) {
        printf("%d\t%s\t%ld\t%s\t%s\t%.2f\n", inventario[i].codigo_maquina,
            inventario[i].nombre_prestado, inventario[i].dni,
            inventario[i].fecha_prestamo, inventario[i].fecha_expiracion,
            inventario[i].valor_asegurado);
    }
}

void modificarFechaExpiracion(struct notebook *inventario, int cantidad, long int dni) {
    char nueva_fecha[12];
    printf("Ingrese la nueva fecha de expiraci�n (dd-mm-yyyy): ");
    scanf("%s", nueva_fecha);

    for (int i = 0; i < cantidad; ++i) {
        if (inventario[i].dni == dni) {
            strcpy(inventario[i].fecha_expiracion, nueva_fecha);
            printf("Fecha de expiraci�n actualizada correctamente.\n");
            return;
        }
    }
    printf("No se encontr� ninguna notebook asociada al DNI proporcionado.\n");
}

void modificarParametros(struct notebook *inventario, int cantidad, int codigo_maquina) {
    for (int i = 0; i < cantidad; ++i) {
        if (inventario[i].codigo_maquina == codigo_maquina) {
            printf("Ingrese nuevos datos para la notebook con c�digo %d:\n", codigo_maquina);
            printf("Nombre prestado: ");
            scanf("%s", inventario[i].nombre_prestado);
            printf("DNI: ");
            scanf("%ld", &inventario[i].dni);
            printf("Fecha de pr�stamo (dd-mm-yyyy): ");
            scanf("%s", inventario[i].fecha_prestamo);
            printf("Fecha de expiraci�n (dd-mm-yyyy): ");
            scanf("%s", inventario[i].fecha_expiracion);
            printf("Valor asegurado: ");
            scanf("%f", &inventario[i].valor_asegurado);
            printf("Par�metros actualizados correctamente.\n");
            return;
        }
    }
    printf("No se encontr� ninguna notebook asociada al c�digo proporcionado.\n");
}

void imprimirYEliminar(struct notebook **inventario, int *cantidad) {
    if (*cantidad == 0) {
        printf("El inventario est� vac�o.\n");
        return;
    }

    printf("------ Inventario de Notebooks ------\n");
    printf("Pos.\tC�d.\tNombre\tDNI\tF. Pr�stamo\tF. Expiraci�n\tValor\n");
    for (int i = 0; i < *cantidad; ++i) {
        printf("%d\t%d\t%s\t%ld\t%s\t%s\t%.2f\n", i + 1,
            (*inventario)[i].codigo_maquina, (*inventario)[i].nombre_prestado,
            (*inventario)[i].dni, (*inventario)[i].fecha_prestamo,
            (*inventario)[i].fecha_expiracion, (*inventario)[i].valor_asegurado);
    }

    int posicion;
    printf("Ingrese la posici�n de la notebook que desea eliminar: ");
    scanf("%d", &posicion);

    if (posicion < 1 || posicion > *cantidad) {
        printf("Posici�n no v�lida.\n");
        return;
    }

    for (int i = posicion - 1; i < *cantidad - 1; ++i) {
        (*inventario)[i] = (*inventario)[i + 1];
    }
    *cantidad -= 1;
    *inventario = (struct notebook*)realloc(*inventario, *cantidad * sizeof(struct notebook));
    printf("Notebook eliminada correctamente.\n");
}

void imprimirEnArchivo(struct notebook *inventario, int cantidad) {
    FILE *archivo = fopen("notebooks.txt", "w");
    if (archivo == NULL) {
        printf("Error al abrir el archivo.\n");
        return;
    }

    fprintf(archivo, "------ Inventario de Notebooks ------\n");
    fprintf(archivo, "C�d.\tNombre\tDNI\tF. Pr�stamo\tF. Expiraci�n\tValor\n");
    for (int i = 0; i < cantidad; ++i) {
        fprintf(archivo, "%d\t%s\t%ld\t%s\t%s\t%.2f\n", inventario[i].codigo_maquina,
            inventario[i].nombre_prestado, inventario[i].dni,
            inventario[i].fecha_prestamo, inventario[i].fecha_expiracion,
            inventario[i].valor_asegurado);
    }

    fclose(archivo);
    printf("Inventario impreso en el archivo notebooks.txt.\n");
}

void guardarEnArchivoBinario(struct notebook *inventario, int cantidad) {
    FILE *archivo = fopen("notebooks.dat", "wb");
    if (archivo == NULL) {
        printf("Error al abrir el archivo.\n");
        return;
    }

    fwrite(&cantidad, sizeof(int), 1, archivo); // Escribir cantidad de elementos primero
    fwrite(inventario, sizeof(struct notebook), cantidad, archivo); // Escribir el arreglo de estructuras
    fclose(archivo);
    printf("Inventario guardado en el archivo notebooks.dat.\n");
}

void cargarDesdeArchivoBinario(struct notebook **inventario, int *cantidad) {
    FILE *archivo = fopen("notebooks.dat", "rb");
    if (archivo == NULL) {
        printf("Error al abrir el archivo.\n");
        return;
    }

    fread(cantidad, sizeof(int), 1, archivo); // Leer la cantidad de elementos primero
    *inventario = (struct notebook*)realloc(*inventario, *cantidad * sizeof(struct notebook));
    fread(*inventario, sizeof(struct notebook), *cantidad, archivo); // Leer el arreglo de estructuras
    fclose(archivo);
    printf("Inventario cargado desde el archivo notebooks.dat.\n");
}