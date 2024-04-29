// ejemplo 5
#include <stdio.h>
int main(){
int n;
char nombre[30];
float salario;
FILE *pArchivo;
pArchivo = fopen("empleados.txt",”a");
if(pArchivo!=NULL){
do{
printf("Ingrese el n%cmero de legajo del empleado\nPara terminar ingrese 0 o n%cmero menor que 0:\n", 
163,163);
scanf("%d",&n);
if(n>0){
printf("Ingrese el nombre del empleado: ");
scanf("%s",nombre);
printf("Ingrese el salario del empleado: ");
scanf("%f",&salario);
fprintf(pArchivo,"%d%15s%15f\n", n,nombre,salario);
}
} while(n>0);
close(pArchivo);}
else{ printf("Error en la apertura del archivo!");}
getchar();
return 0;}
}
