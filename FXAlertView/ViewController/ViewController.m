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
  
  FXAlertController *fxAlertView = [[FXAlertController alloc] initWithTitle:@"ALERT" message:@"This is a cool alert, isn't it?"];
  
  FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
  [standardButton setTitle:@"Sure is!" forState:UIControlStateNormal];
  [fxAlertView addButton:standardButton];
  [standardButton addTarget:self action:@selector(doSomething) forControlEvents:UIControlEventTouchUpInside];
  
  FXAlertButton *cancelButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeCancel];
  [cancelButton setTitle:@"Nah" forState:UIControlStateNormal];
  [fxAlertView addButton:cancelButton];
  [standardButton addTarget:self action:@selector(doSomething) forControlEvents:UIControlEventTouchUpInside];
  
  [self presentViewController:fxAlertView animated:YES completion:nil];
}


- (void) doSomething {
  NSLog(@"Hey, you clicked a button!\n");
}


@end
