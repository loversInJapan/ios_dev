//
//  ViewController.h
//  UI_practice--plus_calculation
//
//  Created by Jon_Snow on 1/11/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/*
 IB = interface builder 界面搭建
 1).IBAction
    如果需要监听按钮的点击方法，可以使用IBAction，就可以与IB（界面）连线，在点击按钮时，就会执行相应的方法
 2).IBOutlet
    如果需要获得／修改界面上控件的属性，使用IBOutlet
 */

@property (nonatomic, weak) IBOutlet UITextField* num1;
@property (nonatomic, weak) IBOutlet UITextField* num2;

@property (nonatomic, weak) IBOutlet UILabel* resultLable;

- (IBAction)compute;

@end

