//
//  main.m
//  practice_weibo
//
//  Created by Jon_Snow on 12/31/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Status.h"

int main(int argc, const char * argv[]) {
    User* Jacy = [[User alloc] init];
    Jacy.name = @"Jacy";

    User* Kate = [[User alloc] init];
    Kate.name = @"Kate";

    Status* tweet0 = [[Status alloc] init];
    tweet0.text = @"what a lovely day";
    tweet0.user = Jacy;

    Status* tweet1 = [[Status alloc] init];
    tweet1.reTweetStatus = tweet0;
    tweet1.text = @"It is!!";
    tweet1.user = Kate;

    //[Kate release];
    return 0;
}
