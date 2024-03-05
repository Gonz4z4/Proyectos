/*Escribe un programa en el que se pida al usuario que ingrese más de una oracion,
las oraciones separadas por un '.'(maximo 200 caracteres) y que verifique que la letra
inicial de la primera palabra de cada oracion este en mayuscola.
De no ser asi imprimir un mensaje por pantalla y cambiar la letra a mayuscula.*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    char cadena[200];
    int i;
    printf("escriba varias oraciones separadas por un .\n");
    gets(cadena);
    for(i=0;cadena[i]!='\0';i++){
        if (i==0){
            while(cadena[i]==' '){
                i++;}
            cadena[i]-=32;}
        if(cadena[i]=='.'){
            i++;
            while(cadena[i]==' '){
                i++;}
            if (cadena[i]>=97&&cadena[i]<=122){
                cadena[i]-=32;}
        }
    }
        printf("%s",cadena);
}
