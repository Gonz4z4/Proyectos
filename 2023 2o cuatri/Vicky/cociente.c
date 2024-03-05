//Ingresando dos numero reales la computadora muestra su cociente, si alguno es cero, que diga q no se puede
#include<stdio.h>
#include<math.h>
int main(){
 float num1, num2, cociente;
 printf("Ingrese un numero\n");
  scanf("%f", &num1);
  printf("Ingrese otro numero\n");
  scanf("%f", &num2);
  if(num1== 0|| num2== 0)
  printf("No se puede\n");
  else{
  cociente = num1/num2;
  printf("La division da %f", cociente);
  }
  return 0;
}
