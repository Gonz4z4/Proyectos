#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char cadena[100];
    printf("Ingrese una cadena de caracteres:\n");
    gets(cadena);
    printf("usted ha ingresado: \n%s\n", cadena);
    printf("la cadena generada es:\n");

    for(int i=0; cadena[i]!='\0'; i++){
        if((cadena[i]>='a' && cadena[i]<'z')||(cadena[i]>='A' && cadena[i]<'Z')){
            cadena[i]++;
            printf("%c",cadena[i]);
        }else{switch(cadena[i]){
                case 'z':
                    printf("a");
                    break;
                case 'Z':
                    printf("A");
                    break;
                default:
                    printf("%c",cadena[i]);
                    break;
            }
        }
    }
}
