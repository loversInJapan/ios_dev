//
//  main.m
//  use_autorelease
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "GoodPerson.h"

/*
 系统自带的方法里面没有包含alloc、new、copy，说明返回的对象都是autorelease的
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Person* p = [[[Person alloc] init] autorelease]; // 这样写代码太长，一般写一个类方法返回一个autorelease的对象
        Person* p = [Person person];
        p.age = 100;

        Person* pp = [Person personWithAge:101];

        GoodPerson* gp = [GoodPerson personWithAge:20];
        // gp.money = 1000; // 会报错，因为此时gp指向的是Person的对象
        // 可以通过重写personWithAge来返回一个GoodPerson对象，但还有更好的办法，即在将PersonWithAge中的Person改为self, 同理可改person类方法
        gp.money = 1000;
    }

    
    return 0;
}
