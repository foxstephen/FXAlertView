//
//  ViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "ViewController.h"
#import "FXAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
}



- (IBAction)present:(id)sender {
    FXAlertController *fxAlertView = [[FXAlertController alloc] initWithTitle:@"DISCLAIMER" message:@"Warning! You must accept the disclaimer before you proceed to conitinue. Do you accept?"];
    
    
    FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    [standardButton setTitle:@"Accept" forState:UIControlStateNormal];
    [fxAlertView addButton:standardButton];
    
    
    FXAlertButton *cancelButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeCancel];
    [cancelButton setTitle:@"Decline" forState:UIControlStateNormal];
    [fxAlertView addButton:cancelButton];
    
    [self presentViewController:fxAlertView animated:YES completion:nil];
}


@end
