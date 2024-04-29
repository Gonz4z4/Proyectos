#include <stdio.h>
#include <string.h>
void ingresar(char *str1,char *str2){
    printf("Ingrese dos cadenas:\n");
    fgets(str1, 50, stdin);
    fgets(str2, 50, stdin);
    printf("str1: %s\nstr2: %s\n",str1,str2);
    return ;
}
int main() {
    int selec=4;
    char str1[50], str2[50];
    
    printf("ingrese un numero:\n1) concatenar las cadenas\n2) copiar cadena 2 en 1\n3) comparar cadenas\n4) longitud cadena\n");
    scanf("%i", &selec);
    fflush(stdin);


    switch (selec){
        case 1: //concatenar
            ingresar(str1,str2);
            strcat(str1,str2);
            str1[strcspn(str1, "\n")] = ' ';
            printf("resultado de la concatenacion: %s\n",str1);
            break;
        
        case 2: //copiar
            ingresar(str1,str2);
            strcpy(str1,str2);
            printf("resultado de la copia: %s\n",str1);
            break;
        
        case 3: //comparar
            ingresar(str1,str2);
            if (strcmp(str1,str2)==0){
                printf("son del mismo tamano :D\n");
            }else if(strcmp(str1,str2)<0){
                printf("str1 es mas grande \n");
            } else {
                printf("str2 es mas grande \n");
            }
            break;
        
        case 4: //longitud
            ingresar(str1,str2);  
            printf("La longitud de str1 es %i\n",(int)strlen(str1));
            printf("La longitud de str2 es %i\n",(int)strlen(str2));
            break;
        
        default:
            break;
    }

return 0;
}