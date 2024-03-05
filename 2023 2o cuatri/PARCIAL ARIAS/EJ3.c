#include <stdio.h>

int main() {
    char cadena[100];
    printf("Ingrese una cadena:\n");
    gets(cadena);
    for(int i=0;cadena[i]!='\0';i++){
        if((cadena[i]>65&&cadena[i]<=90)||(cadena[i]>97&&cadena[i]<=122))
            switch(cadena[i]){
                case 'e':
                case 'i':
                case 'o':
                case 'u':
                case 'E':
                case 'I':
                case 'O':
                case 'U':
                    break;
                default:
                    cadena[i]=' ';
                    break;
            }
    }
    printf("Esta es la oracion resultante: \n%s", cadena);
}

