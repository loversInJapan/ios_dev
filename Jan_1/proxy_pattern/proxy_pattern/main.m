//
//  main.m
//  proxy_pattern
//
//  Created by Jon_Snow on 1/1/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Agent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* man = [[Person alloc] init];
        Agent* agent1 = [[Agent alloc] init];
        man.agent = agent1;
        [man buyTicket];
    }
    return 0;
}
