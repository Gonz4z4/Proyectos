#include <stdio.h>
#include <stdlib.h>
int main() {
    int *ptr;
    
    ptr=(int *)malloc(5 * sizeof(int));
    printf("ptr=%i\n",*ptr); //no inicializa, contenido aleatorio
    if(ptr==NULL){
        printf("ERROR:no se pudo asignar memoria\n");
        exit(1);
    }
    ptr=(int *)calloc(5,sizeof(int));
    printf("ptr=%i\n",*ptr);
    
    ptr=(int *)realloc(ptr, 10*sizeof(int));
    printf("ptr=%i\n",*ptr);

    free(ptr);
    printf("ptr=%i\n",*ptr);
return 0;
}