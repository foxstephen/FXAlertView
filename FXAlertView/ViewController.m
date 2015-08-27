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
    [self present];
}


- (void) present {
    
    FXAlertView *fxAlertView = [[FXAlertView alloc] initWithTitle:@"DISCLAIMER" message:@"This is a story about a man and a horse. Once there was a horse, this horse was the largest horse in the whole of the land. One day when this horse was out with its owner, they stumbled upon a tree. This tree was the largest tree in the wole of the land, and one day this tree was also out with its owner. His owner them stumbled across a horse. This horse was the larges thorse in the whole of the land. Whe nthis horse began to \"neigh\" the world stopped This is a story about a man and a horse. Once there was a horse, this horse was the largest horse in the whole of the land. One day when this horse was out with its owner, they stumbled upon a tree. This tree was the largest tree in the wole of the land, and one day this tree was also out with its owner. His owner them stumbled across a horse. This horse was the larges thorse in the whole of the land. Whe nthis horse began to \"neigh\" the world stopped"];
    
    [self presentViewController:fxAlertView animated:YES completion:nil];
    
    FXAlertButton *standardButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    [standardButton setTitle:@"Accept" forState:UIControlStateNormal];
    [fxAlertView addButton:standardButton];
    
    FXAlertButton *cancelButton = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeCancel];
    [cancelButton setTitle:@"Decline" forState:UIControlStateNormal];
    [fxAlertView addButton:cancelButton];
    
    FXAlertButton *test = [[FXAlertButton alloc] initWithType:FXAlertButtonTypeStandard];
    [test setTitle:@"Accept" forState:UIControlStateNormal];
    [fxAlertView addButton:test];
    
    NSLog(@"Button: %@ ", standardButton);
    
    
}



@end
