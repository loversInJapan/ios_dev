//
//  main.cpp
//  GrayCode
//
//  Created by Jon_Snow on 3/25/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <iostream>
struct A{
    //int b;
    //long a;
    char c;
    int a;
    int b;
    short d;
    int p;
    //char c;
};
void testMemoryAlignment()
{
    //int str[] = {1,2,3,4};
    A a;
    printf("a:%p, b:%p, d:%p, c:%p, p:%p\n", &a.a,&a.b,&a.d,&a.c, &a.p);
    std::cout << sizeof(a) << std::endl;
//    return 0;
}
int main(int argc, const char * argv[]) {
    
}
