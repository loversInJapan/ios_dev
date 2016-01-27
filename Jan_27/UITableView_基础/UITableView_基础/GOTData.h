//
//  GOTData.h
//  UITableView_基础
//
//  Created by Jon_Snow on 1/27/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOTData : NSObject

@property (copy, nonatomic) NSString* title;
@property (copy, nonatomic) NSString* footer;
@property (strong, nonatomic) NSArray* episodes;

@end
