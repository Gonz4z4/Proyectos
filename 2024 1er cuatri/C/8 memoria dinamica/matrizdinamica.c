#include <stdio.h>

int main() {
    int filas, columnas;
    int **ptr;

    ptr=(int **)malloc(filas*sizeof(int *));
    for(int i=0;i<filas;i++){
        ptr [i] = (int *)malloc(columnas*sizeof(int));
    }
    for (int i=0;i<filas;i++){
        free(ptr [i]);
    }
    free(ptr);
    return 0;
}