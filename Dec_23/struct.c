#include <stdio.h>

struct Item{
    double data;
    float f;
    int a;
    char ch;
};

int main()
{
    struct Item item1;
    unsigned size = sizeof(item1);
    printf("%p\n",&item1);
    printf("%p\n",&item1.data);
    printf("%p\n",&item1.f);
    printf("%p\n",&item1.a);
    printf("%p\n",&item1.ch);
    printf("%u\n", size);
    return 0;
}