#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int dado1,dado2,sumDado;
    float apuesta;
    char otra='s';
    printf("Ingrese su apuesta:");
    scanf(" %f",&apuesta);
    while(otra=='s'||otra=='S'){
        srand(time(NULL)); // inicializar el generador de números aleatorios
        dado1 = (rand() % 6) + 1; // generar un número aleatorio entre 1 y 6
        dado2 = (rand() % 6) + 1; // generar un número aleatorio entre 1 y 6
        sumDado=dado1+dado2;
        printf("TRAMPITA:dado 1: %i\ndado 2: %i\nY la suma es: %i\n\n",dado1,dado2,sumDado);
        if(sumDado>=6&&sumDado<=8){
            apuesta*=2;
            printf("GANADOR, se ha duplicado su apuesta. Su apuesta actual es $%.2f\n",apuesta); //CASO GANADOR
        }else if(sumDado==2||sumDado==12){
            apuesta=0;
            printf("PERDIO TODO, Su apuesta actual es $%.2f\n",apuesta); //CASO DEVASTADOR
        }else{
            apuesta/=2;
            printf("PERDIO, su apuesta ha sido dividida. Su apuesta actual es $%.2f\n",apuesta); //CASO PERDEDOR
        }
        printf("desea continuar? (S/N): ");
        scanf(" %c", &otra);
        printf("--------------------\n");
    }
    printf("TERMINADO EL JUEGO. Se va con $%.2f",apuesta);
}


