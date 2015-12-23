//
//  foo.c
//  
//
//  Created by   益康 陈 on 12/23/15.
//
//

#include <stdio.h>

int a;
//static int a = 2;

void foo()
{
    //a = 2;
    printf("a = %d\n", a);
    a = 20;
}