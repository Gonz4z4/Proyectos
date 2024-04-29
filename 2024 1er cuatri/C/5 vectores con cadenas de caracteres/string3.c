#include <stdio.h>
#include <string.h>

int main() {
    char cadena[]= "Hola mundo!";
    int longitud= sizeof(cadena)/sizeof(cadena[0]); // incluye el \0 del final
    printf("%s\n",cadena);
    for (int i = 0; i < longitud; i++){   
    printf("%c ", cadena[i]);

}
printf("\n la cantidad de caracteres de la cadena es %d\n", (int)strlen(cadena)); //no incluye el \0 del final

// concatenar caracteres
    char cadena1[10]= "Hola ";
    char cadena2[10]= "mundo";
    strcat(cadena1,cadena2);
    printf("cadena1: %s\ncadena2: %s\n",cadena1,cadena2); //aca las concateno (conviven ambas en la variable)
    
    printf("%i\n",strcmp(cadena1,cadena2));

    strcpy(cadena1,cadena2);
    printf("cadena1: %s\ncadena2: %s\n",cadena1,cadena2); //en esta una pisa a la otra (hot)
    printf("%i\n",strcmp(cadena1,cadena2));
    

    strcat(cadena2,cadena1);
    printf("cadena1: %s\ncadena2: %s\n",cadena1,cadena2);
    printf("%i\n",strcmp(cadena1,cadena2));
    printf("%s\n",cadena1);
return 0;
}