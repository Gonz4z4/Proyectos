#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char cadena[100];
    printf("Ingrese una cadena de caracteres:\n");
    gets(cadena);
    for (int i = 0; cadena[i] != '\0'; i++) {
            if ('A'<= cadena[i] && cadena[i] <= 'Z') //Si esta entre A (65) y Z (90)
                if (cadena[i] == 'Z')
                    cadena[i]='A';
                else
                    cadena[i]++;  // Cambiar la letra por la siguiente en el alfabet

            if ('a'<= cadena[i] && cadena[i] <= 'z') //Si esta entre a (97) y Z (122)
                 if (cadena[i] == 'z')
                    cadena[i]='a';
                else
                    cadena[i]++;  // Cambiar la letra por la siguiente en el alfabeto
    }


    printf("La cadena resultante es:\n%s", cadena);
    return 0;
}
