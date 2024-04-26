#include <stdio.h>

#define TAMANO_VECTOR 10

void ingresarElementos(int vector[], int *contador) {
    if (*contador >= TAMANO_VECTOR) {
        printf("Error: el vector ya está lleno.\n");
        return;
    }

    printf("Ingrese un número entero para agregar al vector: ");
    scanf("%d", &vector[*contador]);
    (*contador)++;
}

void imprimirElementos(int vector[], int contador) {
    printf("Elementos del vector:\n");
    for (int i = 0; i < contador; i++) {
        printf("%d ", vector[i]);
    }
    printf("\n");
}

int calcularSuma(int vector[], int contador) {
    int suma = 0;
    for (int i = 0; i < contador; i++) {
        suma += vector[i];
    }
    return suma;
}

int encontrarMaximo(int vector[], int contador) {
    int maximo = vector[0];
    for (int i = 1; i < contador; i++) {
        if (vector[i] > maximo) {
            maximo = vector[i];
        }
    }
    return maximo;
}

int encontrarMinimo(int vector[], int contador) {
    int minimo = vector[0];
    for (int i = 1; i < contador; i++) {
        if (vector[i] < minimo) {
            minimo = vector[i];
        }
    }
    return minimo;
}

double calcularPromedio(int vector[], int contador) {
    if (contador == 0) {
        return 0.0;
    }

    int suma = calcularSuma(vector, contador);
    return (double) suma / contador;
}

int main() {
    int vector[TAMANO_VECTOR];
    int opcion;
    int contador = 0;

    do {
        printf("\nMenú:\n");
        printf("1. Ingresar elementos al vector\n");
        printf("2. Imprimir elementos del vector\n");
        printf("3. Calcular suma de elementos del vector\n");
        printf("4. Encontrar el máximo del vector\n");
        printf("5. Encontrar el mínimo del vector\n");
        printf("6. Calcular promedio de elementos del vector\n");
        printf("7. Salir del programa\n");
        printf("Seleccione una opción: ");
        scanf("%d", &opcion);

        switch (opcion) {
            case 1:
                ingresarElementos(vector, &contador);//pasa la direccion
                break;
            case 2:
                imprimirElementos(vector, contador);
                break;
            case 3:
                printf("La suma de los elementos del vector es: %d\n", calcularSuma(vector, contador));
                break;
            case 4:
                printf("El máximo del vector es: %d\n", encontrarMaximo(vector, contador));
                break;
            case 5:
                printf("El mínimo del vector es: %d\n", encontrarMinimo(vector, contador));
                break;
            case 6:
                printf("El promedio de los elementos del vector es: %.2f\n", calcularPromedio(vector, contador));
                break;
            case 7:
                printf("Saliendo del programa...\n");
                break;
            default:
                printf("Opción no válida. Por favor, seleccione una opción válida.\n");
        }
    } while (opcion != 7);

    return 0;
}
