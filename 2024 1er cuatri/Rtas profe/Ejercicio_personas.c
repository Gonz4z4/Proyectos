#include <stdio.h>
#include <string.h>

#define MAX_PERSONAS 10

// Definici�n de la estructura para almacenar los datos de una persona
struct Persona {
    char nombre[50];
    int edad;
    char genero;
};

// Prototipos de funciones
void mostrarMenu();
void cargarDatos(struct Persona personas[], int *numPersonas);
void imprimirDatos(const struct Persona personas[], int numPersonas);
void agregarPersona(struct Persona personas[], int *numPersonas);
void quitarPersona(struct Persona personas[], int *numPersonas);

int main() {
    struct Persona personas[MAX_PERSONAS]; // Vector para almacenar datos de personas
    int numPersonas = 0; // Variable para mantener el n�mero actual de personas
    int opcion;

    do {
        mostrarMenu();
        scanf("%d", &opcion);

        switch (opcion) {
            case 1:
                cargarDatos(personas, &numPersonas);
                break;
            case 2:
                imprimirDatos(personas, numPersonas);
                break;
            case 3:
                agregarPersona(personas, &numPersonas);
                break;
            case 4:
                quitarPersona(personas, &numPersonas);
                break;
            case 5:
                printf("Saliendo del programa...\n");
                break;
            default:
                printf("Opci�n no v�lida. Por favor, seleccione una opci�n v�lida del men�.\n");
        }
    } while (opcion != 5);

    return 0;
}

// Funci�n para mostrar el men� de opciones
void mostrarMenu() {
    printf("\n--- Men� de Opciones ---\n");
    printf("1. Cargar Datos\n");
    printf("2. Imprimir Datos\n");
    printf("3. Agregar Persona\n");
    printf("4. Quitar Persona\n");
    printf("5. Salir\n");
    printf("Seleccione una opci�n: ");
}

// Funci�n para cargar los datos de personas
void cargarDatos(struct Persona personas[], int *numPersonas) {
    char respuesta;

    do {
        printf("Ingrese datos de la persona %d:\n", *numPersonas + 1);
        printf("Nombre: ");
        scanf("%s", personas[*numPersonas].nombre);
        printf("Edad: ");
        scanf("%d", &personas[*numPersonas].edad);
        printf("G�nero (M/F): ");
        fflush(stdin);
        scanf(" %c", &personas[*numPersonas].genero);

        (*numPersonas)++;

        printf("�Desea ingresar otra persona? (S/N): ");
        fflush(stdin);
        scanf(" %c", &respuesta);
    } while (respuesta == 'S' || respuesta == 's');
}

// Funci�n para imprimir los datos de las personas
void imprimirDatos(const struct Persona personas[], int numPersonas) {
    printf("\nDatos de las personas:\n");
    for (int i = 0; i < numPersonas; i++) {
        printf("\nDatos de la persona %d:\n", i + 1);
        printf("Nombre: %s\n", personas[i].nombre);
        printf("Edad: %d\n", personas[i].edad);
        printf("G�nero: %c\n", personas[i].genero);
    }
}

// Funci�n para agregar una persona al vector de personas
void agregarPersona(struct Persona personas[], int *numPersonas) {
    if (*numPersonas < MAX_PERSONAS) {
        printf("\nAgregando una persona:\n");
        printf("Nombre: ");
        scanf("%s", personas[*numPersonas].nombre);
        printf("Edad: ");
        scanf("%d", &personas[*numPersonas].edad);
        printf("G�nero (M/F): ");
        fflush(stdin);
        scanf(" %c", &personas[*numPersonas].genero);

        (*numPersonas)++;
    } else {
        printf("No se pueden agregar m�s personas, el l�mite m�ximo ha sido alcanzado.\n");
    }
}

// Funci�n para quitar una persona del vector de personas por su nombre
void quitarPersona(struct Persona personas[], int *numPersonas) {
    char nombreEliminar[50];
    int indiceEliminar = -1;

    printf("\nIngrese el nombre de la persona que desea eliminar: ");
    scanf("%s", nombreEliminar);

    // Buscar la persona por su nombre
    for (int i = 0; i < *numPersonas; i++) {
        if (strcmp(personas[i].nombre, nombreEliminar) == 0) {
            indiceEliminar = i;
            break;
        }
    }

    if (indiceEliminar != -1) {
        // Eliminar la persona moviendo los elementos siguientes un lugar hacia atr�s
        for (int i = indiceEliminar; i < *numPersonas - 1; i++) {
            strcpy(personas[i].nombre, personas[i + 1].nombre);
            personas[i].edad = personas[i + 1].edad;
            personas[i].genero = personas[i + 1].genero;
        }

        // Decrementar el n�mero de personas
        (*numPersonas)--;

        printf("La persona '%s' ha sido eliminada exitosamente.\n", nombreEliminar);
    } else {
        printf("La persona '%s' no se encuentra en la lista.\n", nombreEliminar);
    }
}
