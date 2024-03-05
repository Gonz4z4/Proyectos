/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
int
main ()
{
    int selec=0;
  int num;
  int fin = 0;
  do
	{
	  char siono;
	  printf ("\ningrese un numero para comenzar la aplicacion \n");
	  scanf ("%d", &num);
	  printf("ingrese:\n1:numeros de 0 al ingresado\n2:calcular el cuadrado del num ingresado\n3:Verificar si es par\n4:salir del programa\n");
	  scanf ("%d", &selec);
	  switch (selec)
		{
		case 1:
		  for (int i = 0; i <= num; i++)
			{
			  printf ("%d ", i);
			}
		  break;
		case 2:
		    int pot = num*num;
		    printf("la potencia cuadrada de ese numero es %d", pot);
		  break;
		case 3:
		    int resto=num%2;
		    if (resto==0){
		        printf("el numero es par");
		    }else{
		        printf("el numero es impar");
		    }
		  break;
		case 4:
		  printf ("seguro que desea salir (s/n)");
		  scanf ("%c", &siono);
		  if (siono == 's' || siono == 'S')
			{
			  fin = 1;
			}
		  
		 break; 
		 default:
		    printf("\ningresar un valor valido");
		    break;
		}
	} while (fin != 1);

  return 0;
}

