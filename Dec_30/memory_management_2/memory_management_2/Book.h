//
//  Book.h
//  memory_management_2
//
//  Created by Jon_Snow on 12/30/15.
//  Copyright © 2015 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
{
    double _price;
}

- (void)setPrice:(double)price;
- (double)price;
@end
