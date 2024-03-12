#include <stdio.h>
void saludar(){
    printf("\nhola mundo");
}
void suma(int a, int b){
    int c;
    c=a+b;
    printf("el resultado de la suma es %d", c);
}
int main (){
    // Fragmento de código que tiene una accion definida
    // Declarar fucniones tipo_de_dato nombre_funcion(parametros){Cuerpo}
    int num1, num2;
    printf("ingese dos numeros:");
    scanf("%d", &num1);
    scanf("%d", &num2);

    suma(num1, num2);
    saludar();
    return 0;
}