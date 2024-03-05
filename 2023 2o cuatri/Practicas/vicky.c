#include <stdio.h>
#include <math.h>

int main(){
    char cadena[10];
    int i;
    gets(cadena);
    for(i=0;cadena[i]!='\0';i++){
        printf("la letra %i de la cadena es %c\n", i, cadena[i]);
    }
}
