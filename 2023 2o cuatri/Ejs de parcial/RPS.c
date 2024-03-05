#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int op;
    char usr;
    do{
        srand(time(NULL));
        op = rand() % 3;
        printf("\nIngrese su eleccion! (i= piedra, A= papel, T=tijera):\n", op);
        scanf("%c", &usr);
        printf("usted ha seleccionado %c\n", usr);
        if(usr=='i'){
            switch(op){
                case 0:
                    printf("EMPATE! eligieron PIEDRA ambos");
                    break;
                case 1:
                    printf("PERDISTE eligio PAPEL y vos PIEDRA");
                    break;
                case 2:
                    printf("GANASTE eligio TIJERA y vos PIEDRA");
                    break;
            }
        }
        if(usr=='a'){
            switch(op){
                case 0:
                    printf("GANASTE eligio PIEDRA y vos PAPEL");
                    break;
                case 1:
                    printf("EMPATE! eligieron PAPEL ambos");
                    break;
                case 2:
                    printf("PERDISTE eligio TIJERA y vos PAPEL");
                    break;
            }
        }
        if(usr=='t'){
            switch(op){
                case 0:
                    printf("PERDISTE eligio PIEDRA y vos TIJERA");
                    break;
                case 1:
                    printf("GANASTE eligio PAPEL y vos TIJERA");
                    break;
                case 2:
                    printf("EMPATE! eligieron TIJERA ambos");
                    break;
            }
        }
    }while(usr!='f');
    /*while(usr!='f'){
        srand(time(NULL));
        op = rand() % 3;
        printf("\nIngrese su elección! (i= piedra, A= papel, T=tijera):\n", op);
        scanf("%c", &usr);
        printf("usted ha seleccionado %c\n", usr);
        if(usr=='i'){
            switch(op){
                case 0:
                    printf("EMPATE! eligieron PIEDRA ambos");
                    break;
                case 1:
                    printf("PERDISTE eligio PAPEL y vos PIEDRA");
                    break;
                case 2:
                    printf("GANASTE eligio TIJERA y vos PIEDRA");
                    break;
            }
        }
        if(usr=='a'){
            switch(op){
                case 0:
                    printf("GANASTE eligio PIEDRA y vos PAPEL");
                    break;
                case 1:
                    printf("EMPATE! eligieron PAPEL ambos");
                    break;
                case 2:
                    printf("PERDISTE eligio TIJERA y vos PAPEL");
                    break;
            }
        }
        if(usr=='t'){
            switch(op){
                case 0:
                    printf("PERDISTE eligio PIEDRA y vos TIJERA");
                    break;
                case 1:
                    printf("GANASTE eligio PAPEL y vos TIJERA");
                    break;
                case 2:
                    printf("EMPATE! eligieron TIJERA ambos");
                    break;
            }
        }
    }while(usr!='f');
    */
    printf("\nTERMINO EL JUEGO");
}
