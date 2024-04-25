#include <stdio.h>
int areaCuadrado(int lado){
    int area;
    area=lado*lado;
    return area;
}
int perCuadrado(int lado){
    int perimetro;
    perimetro=lado*4;
    return perimetro;
}
int areaRectangulo(int base, int altura){
    int area=base*altura;
    return area;
}
int perRectangulo(int base, int altura){
    int perimetro=base*2+altura*2;
    return perimetro;
}
float areaCirculo (float radio){
    float pi=3.14159;
    float area=pi*radio*radio;
    return area;
}
float perCirculo(float radio){
    float pi=3.14159;
    float perimetro=pi*radio*2;
    return perimetro;
}

int main() {
    int selec=1;
    float area, perimetro;
    while (selec!=0){
        printf("Seleccione una opcion:\n1)Calcular el area y perimetro de un cuadrado\n2)Calcular area y perimetro de un rectangulo\n3)Calcular area y perimetro de un circulo\n0)Finalizar el programa\n");
        scanf("%i",&selec);
        switch (selec){
            case 1:
                int lado;
                printf("Usted selecciono calcular el area y perimetro de un cuadrado\nIngrese el lado del cuadrado:\n");
                scanf("%i", &lado);
                area=areaCuadrado(lado);
                perimetro=perCuadrado(lado);
                break;
            case 2:
                int base,altura;
                printf("Usted selecciono calcular el area y perimetro de un rectangulo\nIngrese la base del rectangulo:\n");
                scanf("%i", &base);
                printf("ingrese la altura del rectangulo:");
                scanf("%i", &altura);
                area= areaRectangulo(base, altura);
                perimetro= perRectangulo(base, altura);
                break;
            case 3:
                float radio;
                printf("Usted selecciono calcular el area y perimetro de un circulo\nIngrese el radio:\n");
                scanf("%f", &radio);
                area= areaCirculo(radio);
                perimetro= perCirculo(radio);
                break;
            case 0:
                break;
            default:
                printf("Ingrese un numero valido por favor! :3\n");
                break;
            }
        if (selec==1||selec==2||selec==3){
            printf("el area de la forma seleccionada es %.2f y el perimetro %.2f\n", area, perimetro);
            printf("Desea continuar? si=1, no=0\n");
            scanf("%i", &selec);  
        }
        
    }   
    printf("Te espero la proxima linda >:)\n");
    return 0;
}