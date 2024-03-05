#include <stdio.h>

#define NUM_EMPLEADOS 6

int main() {
    char nombre[100];
    char sexo;
    float horasTrabajadas, sueldoPorHora;
    float sueldoTotalHombres = 0, sueldoTotalMujeres = 0;
    int contadorHombres = 0, contadorMujeres = 0;

    for (int i = 0; i < NUM_EMPLEADOS; i++) {
        printf("Ingrese el nombre del empleado %d: ", i + 1);
        scanf("%s", nombre);

        printf("Ingrese el sexo del empleado (M/F): ");
        scanf(" %c", &sexo);

        printf("Ingrese las horas trabajadas por el empleado: ");
        scanf("%f", &horasTrabajadas);

        printf("Ingrese el sueldo por hora del empleado: ");
        scanf("%f", &sueldoPorHora);

        // Calcular el sueldo para este empleado
        float sueldo = horasTrabajadas * sueldoPorHora;

        // Mostrar el nombre y sueldo del empleado
        printf("Nombre: %s, Sueldo: %.2f\n", nombre, sueldo);

        // Acumular el sueldo total por género
        if (sexo == 'M' || sexo == 'm') {
            sueldoTotalHombres += sueldo;
            contadorHombres++;
        } else if (sexo == 'F' || sexo == 'f') {
            sueldoTotalMujeres += sueldo;
            contadorMujeres++;
        } else {
            printf("Sexo no válido para el empleado %s.\n", nombre);
        }
    }

    // Calcular el sueldo promedio por género
    float sueldoPromedioHombres = sueldoTotalHombres / contadorHombres;
    float sueldoPromedioMujeres = sueldoTotalMujeres / contadorMujeres;

    // Mostrar los totales y promedios
    printf("\nTotales:\n");
    printf("Sueldo total de hombres: %.2f\n", sueldoTotalHombres);
    printf("Sueldo total de mujeres: %.2f\n", sueldoTotalMujeres);
    printf("\nPromedios:\n");
    printf("Sueldo promedio de hombres: %.2f\n", sueldoPromedioHombres);
    printf("Sueldo promedio de mujeres: %.2f\n", sueldoPromedioMujeres);

    return 0;
}
