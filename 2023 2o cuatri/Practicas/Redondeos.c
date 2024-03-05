#include <stdio.h>
#include <math.h>

int main(){
    // REDONDEOS!!
    double x = 6.54321;
    printf("fabs(%f) = %f\n", x, fabs(x));
    printf("round(%f)- %f\n", x, round(x));
    printf("floor(%f)- %f\n", x, floor(x));
    printf("ceil(%f)- %f\n", x, ceil(x));

    float superficie, lado, perimetro;
    printf("ingrese la superficie \n");
    scanf(" %f", &superficie);

    lado = sqrt(superficie);
    perimetro=4*lado;

    printf("superficie = %f\n", superficie);
    printf("lado = %f\n", lado);
    printf("perimetro = %f\n", perimetro);

    return 0;
}
