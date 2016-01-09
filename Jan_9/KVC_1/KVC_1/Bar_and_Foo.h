//
//  Bar_and_Foo.h
//  KVC_1
//
//  Created by Jon_Snow on 1/9/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bar : NSObject
{
//    @public
//    NSString* stringOnBar;
}


@property (nonatomic, strong) NSArray* array;
@property (nonatomic, strong) NSString* stringOnBar;

@end

@interface Foo : NSObject

@property (nonatomic, strong) NSString* stringOnFoo;
@property (nonatomic, strong) Bar* bar;

@end
