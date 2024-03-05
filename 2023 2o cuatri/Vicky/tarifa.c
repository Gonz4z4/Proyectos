//Visualizar la tarifa de luz segun el gasto de corriente electrica. Para un gasto menor a 1000 kw la tarifa es 1.2, entre 1000 y 1850
// es 1.0 y mayor a 1850 es de 0.9
#include<stdio.h>
#include<math.h>
int main(){
int corriente;
float tarifa;
printf("Introducir gasto corriente electrica\n");
scanf("%i",&corriente);
 if(corriente <1000){
        tarifa = corriente* 1.2;
 }else if(corriente < 1850){
     tarifa = corriente* 1.0;
  } else
  tarifa = corriente *0.9;

  printf("Su tarifa es de %f\n", tarifa);




return 0;
}
