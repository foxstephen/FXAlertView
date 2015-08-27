//
//  ViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "ViewController.h"
#import "FXAlert.h"


@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
}



- (IBAction)present:(id)sender {
    FXAlertController *fxAlertView = [[FXAlertController alloc] initWithTitle:@"DISCLAIMER" message:@"Warning!"];
    
    
    FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    [standardButton setTitle:@"Accept" forState:UIControlStateNormal];
    [fxAlertView addButton:standardButton];
    [standardButton addTarget:self action:@selector(colour) forControlEvents:UIControlEventTouchUpInside];
    
    [self presentViewController:fxAlertView animated:YES completion:nil];
}


- (void) colour {
    printf("Hello world.");
}

@end
