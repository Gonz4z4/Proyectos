#include <stdio.h>
void cargaMatriz(int matriz[][3],int *filas,int *columnas){
    for (int i = 0; i <*filas; i++){
        for (int j = 0; j < *columnas; j++){
            printf("ingrese para la fila %i el elemento %i\n", i, j);
            scanf("%i", &matriz[i][j]);
        }
    }
};
int main() {
    int filas=2, columnas=3;
    int matriz[filas][columnas];
    cargaMatriz(matriz,&filas,&columnas);
    for (int i = 0; i <filas; i++){
        for (int j = 0; j < columnas; j++){
            printf("el elemento de la matriz [%i][%i] es: %i\n", i, j,matriz[i][j]);
        }
        
    }
    printf("*matriz[0] es: %i\n",*matriz[0]); //es un puntero de donde comienza la fila 0 (&matriz[0][0])
    printf("*matriz[0] es: %i\n",*matriz[0+1]); //es un puntero de donde comienza la fila 1 (&matriz[1][0])
    printf("*matriz[0] es: %i\n",*(*(matriz+1))); //es un puntero de donde comienza la fila 1 (&matriz[1][0])
    printf("*matriz[0] es: %i\n",*(*(matriz+1)+1)); //es un puntero de donde comienza la fila 1 col 1 (&matriz[1][1])
    printf("*matriz[0] es: %i\n",*(matriz[1]+1)); //es un puntero de donde comienza la fila 1 col 1 (&matriz[1][1])
    


return 0;
}