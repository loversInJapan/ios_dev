//
//  Person.h
//  memory_management_2
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Person : NSObject
{
    Book* _book;
    NSString* _name;
}

- (void)setBook:(Book*)book;
- (Book*)book;

- (void)setName:(NSString*)name;
- (NSString*)name;

@end
