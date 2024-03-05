#include <stdio.h>


int main() {
    char cadena[100];
    printf("Ingrese una cadena de caracteres:\n");
    gets(cadena);
    printf("usted ha ingresado: \n%s\n", cadena);

    for (int i = 0; cadena[i] != '\0'; i++) {
        if ((cadena[i] >= 'A' && cadena[i] <'Z')||(cadena[i] >= 'a' && cadena[i] <'z')){
        cadena[i]++;
        }else if ((cadena[i]=='z')||(cadena[i]=='Z')){
        cadena[i]-25;}
        }
    printf("La cadena resultante es:\n%s", cadena);
    return 0;
}
