#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char opcionUsuario;
    int opcionComputadora;

    srand(time(NULL)); // Inicializar generador de n�meros aleatorios
    // Obtener elecci�n aleatoria de la computadora (0 - piedra, 1 - papel, 2 - tijera)
    opcionComputadora = rand() % 3;

    printf("Bienvenido al juego Piedra, papel o tijera.\n");
    printf("Ingrese su eleccion (I - piedra, A - papel, T - tijera):\n");
    scanf("%c", &opcionUsuario);




    switch(opcionUsuario){
        case 'I': //piedra
            switch(opcionComputadora){
                case 0: //piedra
                    printf("Usted elegio pierda y la PC piedra.\n");
                    printf("Empate.\n");
                    break;

                case 1: //papel
                    printf("Usted elegio pierda y la PC papel.\n");
                    printf("Perdiste.\n");
                    break;
                case 2: //tijera
                    printf("Usted elegio pierda y la PC tijera.\n");
                    printf("Ganaste.\n");
                    break;
            }
            break;
            case 'A': //papel
            switch(opcionComputadora){
                case 0: //piedra
                    printf("Usted elegio papel y la PC piedra.\n");
                    printf("Ganaste.\n");
                    break;

                case 1: //papel
                    printf("Usted elegio papel y la PC papel.\n");
                    printf("Empate.\n");
                    break;

                case 2: //tijera
                    printf("Usted elegio papel y la PC tijera.\n");
                    printf("Perdiste.\n");
                    break;
            }
            break;

        case 'T': //tijera
            switch(opcionComputadora){
                case 0: //piedra
                    printf("Usted elegio tijera y la PC piedra.\n");
                    printf("Perdiste.\n");
                    break;

                case 1: //papel
                    printf("Usted elegio tijera y la PC papel.\n");
                    printf("Ganaste.\n");
                    break;

                case 2: //tijera
                    printf("Usted elegio tijera y la PC tijera.\n");
                    printf("Empate.\n");
            }
            break;

        default:
            printf("Opcion invalida.\n");
            break;
    }


    return 0;
}
