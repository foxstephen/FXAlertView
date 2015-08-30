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
    FXAlertController *fxAlertView = [[FXAlertController alloc] initWithTitle:@"DISCLAIMER" message:@"Warning, for you to conitinue using this service you will need to accept the disclaimer. Do you accept?"];
    
    FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    [standardButton setTitle:@"Accept" forState:UIControlStateNormal];
    [fxAlertView addButton:standardButton];
    [standardButton addTarget:self action:@selector(colour) forControlEvents:UIControlEventTouchUpInside];
    
    
    FXAlertButton *cancelButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeCancel];
    [cancelButton setTitle:@"Decline" forState:UIControlStateNormal];
    [fxAlertView addButton:cancelButton];
    
    [self presentViewController:fxAlertView animated:YES completion:nil];
}

- (IBAction)presentAlertTwo:(id)sender {
    
    FXAlertController *fxAlert = [[FXAlertController alloc] initWithTitle:@"Title two" message:@"This is another message"];
    
    FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    [standardButton setTitle:@"Accept" forState:UIControlStateNormal];
    
    [fxAlert addButton:standardButton];
    
    [self presentViewController:fxAlert animated:YES completion:nil];
}


- (void) colour {
    printf("Hello world.");
}

@end
