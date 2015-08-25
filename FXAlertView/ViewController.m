//
//  ViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "ViewController.h"
#import "FXAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(present) withObject:nil afterDelay:0.5];
}


- (void) present {
    FXAlertView *c = [[FXAlertView alloc] initWithTitle:@"test" message:@"This is a test, of a test, of a test of a test, of a test, of a test."];
    [self presentViewController:c animated:YES completion:nil];
}

@end
