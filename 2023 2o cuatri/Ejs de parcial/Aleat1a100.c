#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    int numGen, num1,i;
    srand(time(NULL));
    numGen = rand() % 100 + 1;
    //i=2;
    for(i=2; i>=0; i--){
        printf("ingrese un numero del 1 al 100\n%i\n", numGen);
        scanf("%i", &num1);
        if(numGen==num1){ //CASO GANADOR
            printf("felicidades adivinaste el numero! este era %i\n", numGen);
            break;
        }else if(i==0){ //CASO PERDEDOR
            printf("SOS MALISIMO\n");
            break;
        }else if (numGen<num1){ //CASO MAYOR
            printf("Ese numero es mayor!\n");
        }else if (numGen>num1){ //CASO MENOR
            printf("Ese numero es menor!\n");
        }
        printf("le quedan %i intentos\n", i);
    }
    printf("TERMINO EL JUEGO");
    /*do{ printf("ingrese un numero del 1 al 100\n%i\n", numGen);
        scanf("%i", &num1);
        if(numGen==num1){ //CASO GANADOR
            printf("felicidades adivinaste el numero! este era %i\n", numGen);
            break;
        }else if(i==0){ //CASO PERDEDOR
            printf("SOS MALISIMO\n");
            break;
        }else if (numGen<num1){ //CASO MAYOR
            printf("Ese numero es mayor!\n");
        }else if (numGen>num1){ //CASO MENOR
            printf("Ese numero es menor!\n");
        }
        printf("le quedan %i intentos\n", i);
        i--;
    } while(i>=0);*/
    /*while(i>=0){
        printf("ingrese un numero del 1 al 100\n%i\n", numGen);
        scanf("%i", &num1);
        if(numGen==num1){ //CASO GANADOR
            printf("felicidades adivinaste el numero! este era %i\n", numGen);
            break;
        }else if(i==0){ //CASO PERDEDOR
            printf("SOS MALISIMO\n");
            break;
        }else if (numGen<num1){ //CASO MAYOR
            printf("Ese numero es mayor!\n");
        }else if (numGen>num1){ //CASO MENOR
            printf("Ese numero es menor!\n");
        }
        printf("le quedan %i intentos\n", i);
        i--;
    }*/

}

