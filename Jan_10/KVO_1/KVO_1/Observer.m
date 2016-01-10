//
//  Observer.m
//  KVO_1
//
//  Created by Jon_Snow on 1/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "Observer.h"

@implementation Observer

- (instancetype)init
{
    if(self = [super init]){
        self.point = [[MyPoint alloc] init];
    }
    return self;
}

- (instancetype)initWithPoint:(MyPoint *)inpoint
{
    if(self = [super init]){
        _point = inpoint;

        [_point addObserver:self forKeyPath:@"x" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];

        [_point addObserver:self forKeyPath:@"y" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                                ofObject:(id)object
                                change:(NSDictionary<NSString *,id> *)change
                                context:(void *)context
{
    NSNumber* oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString* newValue = [change objectForKey:NSKeyValueChangeNewKey];

    if ([keyPath  isEqual: @"x"])
        NSLog(@"value for x changed from %f to %f",
                            [oldValue floatValue],
                            [newValue floatValue]);

    if ([keyPath  isEqual: @"y"]) {
        NSLog(@"value for y changed from %f to %f",
                            [oldValue floatValue],
                            [newValue floatValue]);
    }
}

- (void)dealloc
{
    [_point removeObserver:self forKeyPath:@"x"];
    [_point removeObserver:self forKeyPath:@"y"];
}
@end
