/*
Escribir un programa que lea una cadena de caracteres y le cambie todas las vocales (tanto
mayúsculas como minúsculas, no es necesario tener en cuenta las vocales con tilde) por un
espacio (' '). Luego, debe mostrar la cadena resultante por pantalla.
Ejemplo de entrada:
"Esta es una oración de prueba"
Ejemplo de salida:
" st s n r c ón d pr b"
*/
#include <stdio.h>

int main() {
    char cadena[100];
    printf("Ingrese una oracion:\n");
    gets(cadena);

    for (int i = 0; cadena[i] != '\0'; i++) {
        switch (cadena[i]){
        case 'a':
        case 'e':
        case 'i':
        case 'o':
        case 'u':
        case 'A':
        case 'E':
        case 'I':
        case 'O':
        case 'U':
            cadena[i]=' ';
            break;
        default:
            break;
        }
    }
    printf("%s",cadena);
}
