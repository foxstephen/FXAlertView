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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(present) withObject:nil afterDelay:0.5];
}


- (void) present {
    
    FXAlertView *fxAlertView = [[FXAlertView alloc] initWithTitle:@"ALERT" message:@"This is an alert, you have been alerted!"];
    
    [self presentViewController:fxAlertView animated:YES completion:nil];
    
    FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    [standardButton setTitle:@"Okay" forState:UIControlStateNormal];
    [fxAlertView addButton:standardButton];
    
    FXAlertButton *cancelButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeCancel];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [fxAlertView addButton:cancelButton];
    
    
    
}



@end
