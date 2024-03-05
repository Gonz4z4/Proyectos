#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char x=0;
    int tazDia;
    float prec, cantVen;
    for(int i=1;i<=7;i++){
        printf("-------------\nDIA %i\n",i);
        while(x!='X'){
            while(x!='P'||x!='M'||x!='G'||x!='X'){
                printf("Tamanio taza: ");
                scanf(" %c", x);
            }
            tazDia++;
            while(prec<=0){
                printf("\nprecio unitario: ");
                scanf("%i", prec);
            }
            while(cantVen<=0){
                printf("\nCantidad vendida: ");
                scanf("%i", cantVen);
            }
        }
        printf("cantidad vendida de tazas: %i", tazDia);
    }
    //No llegué a continuarlo por el tiempo! pero podría seguirlo
}
