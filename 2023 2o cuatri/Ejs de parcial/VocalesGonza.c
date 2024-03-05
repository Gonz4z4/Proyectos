#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char palabra[100];
    printf("Ingrese una palabra\n");
    gets(palabra);
    for (int i=0; palabra[i]!='\0'; i++){
        if(palabra[i]=='a'||palabra[i]=='e'||palabra[i]=='i'||palabra[i]=='o'||palabra[i]=='u'||
           palabra[i]=='A'||palabra[i]=='E'||palabra[i]=='I'||palabra[i]=='O'||palabra[i]=='U'){
            palabra[i]=' ';
        }
    }
    printf("\nRespuesta: %s", palabra);
}
