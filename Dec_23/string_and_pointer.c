#include <stdio.h>

int main()
{
    char* name1 = "apple";
    char* name2 = "apple";
    printf("%p\n%p\n", name1,name2);
    char* strs[2] = {"jack", "robin"};
    strs[0] = "jones";
    char strs2[2][10] = {[1] = "jack", [0] = "robin"};
    strs2[0][0] = 'a';
    printf("%s\n", strs2[0]);
    return 0;
}