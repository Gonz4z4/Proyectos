#include <stdio.h>
struct mascotas{
            char nomb[20];
            int edadmasc;
            float alturamasc;
        };
struct persona{
        char nombre[20];
        int edad;
        float altura;
        struct mascotas masc;
};

int main() {
    struct persona gonza={"gonza",22,1.7,{"chimichurri",1,0.2}};
    struct persona topi={"triceratops",1,0.3,{}};
    struct persona india={"india",7,0.4,{}};

    printf("%s:\nedad:%i\naltura:%.2f\n\n",india.nombre,india.edad,india.altura);
    printf("%s:\nedad:%i\naltura:%.2f\n\n",gonza.nombre,gonza.edad,gonza.altura);
        printf("%s:\nedad:%i\naltura:%.2f\n\n",topi.nombre,topi.edad,topi.altura);
    printf("%s:\nedad:%i\naltura:%.2f\n\n",gonza.masc.nomb,gonza.masc.edadmasc,gonza.masc.alturamasc);



return 0;
}