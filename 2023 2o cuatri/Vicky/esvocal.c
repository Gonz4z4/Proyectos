int main(){
char caracter;
 printf("Introducir caracter\n");
 scanf("%c", &caracter);
 switch(caracter){
 case 'a':
 case 'e':
 case 'i':
 case 'o':
 case 'u':
 case 'U':
 case 'O':
 case 'I':
 case 'E':
 case 'A':
     printf("El caracter es vocal\n");
     break;
 default:
    printf("No es vocal\n");
     }
     return 0;
}
