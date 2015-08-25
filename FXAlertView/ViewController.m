//
//  ViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "ViewController.h"
#import "FXAlertViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(present) withObject:nil afterDelay:0.5];
}


- (void) present {
    FXAlertViewController *c = [[FXAlertViewController alloc] initWithTitle:@"test" message:@"This is a test"];
    [self presentViewController:c animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
