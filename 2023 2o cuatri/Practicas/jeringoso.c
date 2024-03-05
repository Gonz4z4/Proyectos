#include <stdio.h>


int main(){
    char cadena[100], jeringoso[100];
    printf("INGRESE UNA CADENA\n");
    gets(cadena);
    int x=0; // "i" del geringoso
    for(int i=0; cadena[i]!='\0';i++){
        jeringoso[x]=cadena[i];
        switch(cadena[i]){
            case 'A':
                x++;
                jeringoso[x]='P';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'E':
                x++;
                jeringoso[x]='P';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'I':
                x++;
                jeringoso[x]='P';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'O':
                x++;
                jeringoso[x]='P';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'U':
                x++;
                jeringoso[x]='P';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'a':
                x++;
                jeringoso[x]='p';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'e':
                x++;
                jeringoso[x]='p';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'i':
                x++;
                jeringoso[x]='p';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'o':
                x++;
                jeringoso[x]='p';
                x++;
                jeringoso[x]=cadena[i];
                break;
            case 'u':
                x++;
                jeringoso[x]='p';
                x++;
                jeringoso[x]=cadena[i];
                break;
        }
        x++;
    }
    jeringoso[x]='\0';
    printf("%s", jeringoso);
}
