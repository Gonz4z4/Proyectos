#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int opcionComputadora;
    char opcionUsuario;

    srand(time(NULL)); // Inicializar generador de n�meros aleatorios

    // Obtener elecci�n aleatoria de la computadora (0 - piedra, 1 - papel, 2 - tijera)
    opcionComputadora = rand() % 3;

    // Pedir la elecci�n al usuario
    printf("Elige una opci�n:\n");
    printf("I - Piedra\n");
    printf("A - Papel\n");
    printf("T - Tijera\n");
    printf("Tu elecci�n: ");
    scanf(" %c", &opcionUsuario);

    // Mostrar la elecci�n del usuario y de la computadora
    printf("Elecci�n del usuario: %c\n", opcionUsuario);
    if (opcionComputadora == 0)
        printf("Elecci�n de la computadora: I (Piedra)\n");
    else if (opcionComputadora == 1)
        printf("Elecci�n de la computadora: A (Papel)\n");
    else
        printf("Elecci�n de la computadora: T (Tijera)\n");

    // Determinar el resultado
    if ((opcionUsuario == 'I' && opcionComputadora == 2);
        (opcionUsuario == 'A' && opcionComputadora == 0);
        (opcionUsuario == 'T' && opcionComputadora == 1);) {
        printf("�Ganaste!\n");
    } else if ((opcionUsuario == 'I' && opcionComputadora == 1)
               (opcionUsuario == 'A' && opcionComputadora == 2)
               (opcionUsuario == 'T' && opcionComputadora == 0)) {
        printf("�La computadora gana!\n");
    } else {
        printf("Es un empate.\n");
    }

    return 0;
}
