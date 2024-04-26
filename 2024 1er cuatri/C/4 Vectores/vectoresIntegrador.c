#include <stdio.h>
void ingresar(int vector[],int *contador,int *longitud){
    int confirmar=1;
    do{
        printf("Ingrese un numero para la posicion %i\n",*contador);
        scanf("%i", &vector[*contador]);
        (*contador)++;
        printf("ingrese 0 para dejar de agregar numeros");
        scanf("%i", &confirmar);
    }while ((*contador<=*longitud)&&(confirmar!=0));
}
void imprimir(int vector[],int contador){
    for (int i = 0; i < contador; i++){
        printf("%i ",vector[i]);
    }
    printf("\n");
}
int suma(int vector[],int contador){
    int suma=0;
    for (int i = 0; i < contador; i++){
        suma+=vector[i];
    }
    return suma;
}
int maximo(int vector[],int contador){
    int maximo=vector[0];
    for (int i = 0; i < contador; i++){
        if (maximo<vector[i]){
            maximo=vector[i];
        }
    }
    return maximo;
}
int minimo(int vector[],int contador){
    int minimo=vector[0];
    for (int i = 0; i < contador; i++){
        if (minimo>vector[i]){
            minimo=vector[i];
        }
    }
    return minimo;
}
double promedio(int vector[],int contador){
    double suma=0, promedio=0;
    for (int i = 0; i < contador; i++){
        suma+=vector[i];
    }
    promedio=suma/ ((double)contador-1);
    return promedio;
}

int main() {
    int select=1, contador=0, longitud=9, rta=0;
    int vector[longitud];
    do{
        printf("ingrese un numero:\n");
        printf("1) ingresar un numero al vector\n");
        printf("2) imprimirlos\n");
        printf("3) sumarlos\n");
        printf("4) ver el maximo\n");
        printf("5) ver el minimo\n");
        printf("6) calcular el promedio\n");
        printf("0) Salir\n");
        scanf("%i", &select);
        switch (select){
            case 1: //ingresar
                ingresar(vector,&contador,&longitud);
                break;
            case 2: //imprimir
                imprimir(vector,contador);
                break;
            case 3: //suma
                rta = suma(vector, contador);
                printf("la suma de todos los elementos del vector es: %i\n",rta);
                break;
            case 4: //maximo
                rta= maximo(vector,contador);
                printf("el maximo de todos los elementos del vector es: %i\n",rta);
                break;
            case 5: //minimo
                rta=minimo(vector,contador);   
                printf("el minimo de todos los elementos del vector es: %i\n",rta);
                break;
            case 6: //promedio
                double prom=promedio(vector,contador);
                printf("el promedio de todos los elementos del vector es: %.2f\n",prom);
                break;
            case 0: //salir
            
                break;
            default:
                break;
        }
    } while (select!=0);
    return 0;
}