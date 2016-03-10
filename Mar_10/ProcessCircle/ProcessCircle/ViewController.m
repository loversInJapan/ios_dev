//
//  ViewController.m
//  ProcessCircle
//
//  Created by Jon_Snow on 3/10/16.
//  Copyright © 2016 Jon. All rights reserved.
//

#import "ViewController.h"
#import "ProcessCircleView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ProcessCircleView *processcircle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderChanged:(UISlider*)sender {
    self.processcircle.finished = sender.value;
}
@end
