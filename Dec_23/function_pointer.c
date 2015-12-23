//
//  function_pointer.c
//  
//
//  Created by   益康 陈 on 12/23/15.
//
//

#include "function_pointer.h"

char* foo(unsigned size)
{
    if(size){
        char* p = (char*)malloc(sizeof(char) * size);
        return p;
    }else{
        return NULL;
    }
}

int main()
{
    char* str;
    char* (*fp) (unsigned) = foo;
    str = (*fp)(5);
    printf("size of str = %lu\n", sizeof(str));
    return 0;
}