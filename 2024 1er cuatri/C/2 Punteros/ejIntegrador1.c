#include <stdio.h>
int main(){
    //usuario debe ingresar:
    //cantidad de num a procesar
    //cada num 1 por 1
    //debe mostrar suma y multi de cada numero
    int cantNum, *pCantNum=&cantNum,*p, suma=0, multi=1;
    printf("ingrese cuantos numeros quiere ingresar\n");
    scanf("%i",pCantNum);
    printf("cantNum es: %i\n",cantNum);
    for (int i = 0; i < cantNum; i++){
        int num;
        p=&num;
        printf("ingrese el numero\n");
        scanf("%i",p);
        suma+=*p; //*p referencia al numero adentro de p y p es la dirección de memoria del numero
        multi*=*p;
    }   
    printf("esto es p por si te da duda %i\n",p);
    printf("la suma da %i y la multiplicacion %i\n",suma, multi);
}