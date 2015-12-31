//
//  main.m
//  autorelease
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {

    //Person* p = [[[Person alloc] init] autorelease];
    // autorelease是个对象方法，返回对象本身
    // autorelease会将对象放到一个自动释放池中，当自动释放池被销毁时，会对池子里面的所有对象做一次release操作。
    // 自动释放池可以创建无数多个，相互嵌套。
    @autoreleasepool {// 开始创建了对象池
        Person* p = [[[Person alloc] init] autorelease];
    }// 代表对象池被销毁

    /* 
     autorelease使用建议：
     1）占用内存较大的对象不要随便使用autorelease
     2）占用内存较小的对象使用autorelease没有太大的影响
    */

    /*
     1）在iOS程序运行过程中，会创建无数个池子。这些赤字都是以栈结果存在
     2）当一个对象调用autorelease方法时，会将这个对象放到栈顶的释放池中
     */
    return 0;
}
