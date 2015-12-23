//
//  static_extern.c
//  
//
//  Created by   益康 陈 on 12/23/15.
//
//

#include "static_extern.h"

extern int a;

void foo();

int main()
{
    a = 10;
    foo();
    printf("a = %d\n", a);
}