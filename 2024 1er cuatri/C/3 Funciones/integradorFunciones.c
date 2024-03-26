#include <stdio.h>
int areaCuadrado(int);
int perCuadrado(int);

int areaRectangulo(int,int);
int perRectangulo(int,int);

float areaCirculo(float,int);
float perCirculo(float,int);

int main() {
    const float pi=3.14;
    int lado, base, altura, radio, opc,area, perimetro, fin=0;
    do{
        printf("ingrese una opcion:\n1.Calcular area y perimetro de un cuadrado.\n2.Calcular area y perimetro de un rectangulo\n3.Calcular area y perimetro de un ciculo\n4.salir\n");
        scanf("%i", &opc);
        switch (opc){
            case 1:
                printf("ingrese el lado del cuadrado: \n");
                scanf("%i", &lado);

                area=areaCuadrado(lado);
                perimetro=perCuadrado(lado);

                printf("El area es: %i\ny el perimetro es: %i\n",area,perimetro);
                break;

            case 2:
                printf("ingrese la base del rectangulo:\n");
                scanf("%i", &base);
                printf("ingrese la altura del rectangulo:\n");
                scanf("%i", &altura);

                area=areaRectangulo(base,altura);
                perimetro=perRectangulo(base,altura);
                
                printf("El area es: %i\ny el perimetro es: %i\n",area,perimetro);
                break;

            case 3:
                float areac, perimetroc;
                printf("ingrese el radio del circulo:\n");
                scanf("%i", &radio);

                areac=areaCirculo(pi,radio);
                perimetroc=perCirculo(pi,radio);
                
                printf("El area es: %.2f\ny el perimetro es: %.2f\n",areac,perimetroc);
                break;

            case 4:
                fin=1;
                break;

            default:
                printf("Por favor ingrese un numero valido\n");
                break;
            }

    }while (fin!=1);
    return 0;
}

int areaCuadrado(int lado){
    int area = lado*lado;
    return area;
    }
int perCuadrado(int lado){
    int perimetro = lado*4;
    return perimetro;
    }
int areaRectangulo(int base,int altura){
    int area = base * altura;
    return area;
    }
int perRectangulo(int base,int altura){
    int perimetro = base*2 + altura*2;
    return perimetro;
    }
float areaCirculo(float pi,int radio){
    float areac = pi*radio*radio;
    return areac;
    }
float perCirculo(float pi,int radio){
    float perimetroc = pi*radio*2;
    return perimetroc;
    }
