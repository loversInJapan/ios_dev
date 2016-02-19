//
//  main.m
//  MemoryTest
//
//  Created by Jon_Snow on 2/18/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

char* GetMemory(void)
{
    char *p = "helloworld";
//    char p[] = "helloworld";
    return p;
}

void getMemory(char* p)
{
    p = (char*)malloc(100);
}

int main(int argc, const char * argv[]) {
    char* str = NULL;
//    char str[] = "";
    str = GetMemory();
//    strcpy(str, "hello");
    printf("%s\n", str);
    char s[] = "xixixi";
    printf("%s\n", s);

    return 0;
}
