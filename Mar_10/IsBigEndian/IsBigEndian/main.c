//
//  main.c
//  IsBigEndian
//
//  Created by Jon_Snow on 3/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#include <stdio.h>

void isLittleEndian()
{
    union w{
        int a;
        char b;
    }c;
    c.a = 1;
    if (c.b == 0x00) {
        printf("big endian\n");
    }
    if (c.b == 0x01){
        printf("little endian\n");
    }

}

int main(int argc, const char * argv[]) {
    int val = 0x12345678;
    int str[3] = {0x12345678, 0x23456789, 0x45678901};
    printf("one = %p\n",str);
    printf("two = %p\n",str+1);
    printf("three = %p\n",str+2);

    short* cp = (short*)&val;
    if (*cp == 0x5678) {
        printf("big endian\n");
    }else if(*cp == 0x1234){
        printf("little endian\n");
    }else
        printf("error\n");
    isLittleEndian();
    return 0;
}

