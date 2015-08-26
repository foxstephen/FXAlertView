//
//  FXAlertViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "FXAlertView.h"


@interface FXAlertView () {
    CGFloat screenWidth;
    CGFloat screenHeight;
    NSUInteger numberOfButtons;
}

@property (strong, nonatomic) UIView *alertView;
@property (strong, nonatomic) UILabel *alertTitle;
@property (strong, nonatomic) UITextView *alertMessageTextView;
@property (strong, nonatomic) NSMutableDictionary *buttons;

@property (nonatomic, readonly) CGRect singleButtonRect; // Used if theres only one button on the view.
@property (nonatomic, readonly) CGRect standardButtonRect; // Used if there's two buttons added to the view.
@property (nonatomic, readonly) CGRect cancelButtonRect; // Used if there's two buttons added to the view.

@end

@implementation FXAlertView

const NSString *standardButtonKey = @"standardButton";
const NSString *cancelButtonKey = @"cancelButton";


#pragma mark Object Life Cycle.
- (instancetype) initWithTitle:(NSString *) title message:(NSString *) message {
    
    if(self = [super init]) {
        

        screenWidth = [[UIScreen mainScreen] bounds].size.width;
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
        
        
        
        _defaultColour = [UIColor whiteColor];
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        
        _alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth * 0.8, screenHeight * 0.52)];
        _alertView.layer.masksToBounds = YES;
        _alertView.layer.cornerRadius = 4.0;
        _alertView.backgroundColor = _defaultColour;
        _alertView.center = self.view.center;
        [self.view addSubview:_alertView];
        
        
        _alertTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                0,
                                                                _alertView.frame.size.width,
                                                                _alertView.frame.size.height * 0.2)];
        _alertTitle.text = title;
        _alertTitle.textAlignment = NSTextAlignmentCenter;
        _alertTitle.textColor = [UIColor grayColor];
        _alertTitle.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:20];
        [_alertView addSubview:_alertTitle];
        
        
        _alertMessageTextView = [[UITextView alloc] initWithFrame:CGRectMake(0,
                                                                             _alertView.frame.size.height * 0.2,
                                                                             _alertView.frame.size.width,
                                                                             _alertView.frame.size.height - _alertTitle.frame.size.height * 2)];
        [_alertMessageTextView setFont: [UIFont fontWithName:@"Avenir Next" size:25]];
        _alertMessageTextView.text = message;
        _alertMessageTextView.selectable = NO;
        _alertMessageTextView.editable = NO;
        _alertMessageTextView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        _alertMessageTextView.textAlignment = NSTextAlignmentLeft;
        _alertMessageTextView.textContainerInset = UIEdgeInsetsMake(0, 10, 0, 0);
        _alertMessageTextView.textColor = [UIColor whiteColor];

        [_alertView addSubview:_alertMessageTextView];
        
    }
    return self;
}


- (void) present {
    
}


// TODO: If there is a button for a type already
// added make sure there not added on top of each other.
- (void) addButton:(FXAlertButton*) button {

    if(!self.buttons) {
        self.buttons = [[NSMutableDictionary alloc] initWithCapacity:2];
    }
    
    if (button.type == FXAlertButtonTypeStandard) {
        
        // If there's already a button added, delete
        // it and add the new button we want to add.
        if (self.buttons[standardButtonKey]) {

            FXAlertButton *button = self.buttons[standardButtonKey];
            button = nil;
        }
        
        // Add the new button.
        [self.buttons setObject:button forKey:standardButtonKey];
        
        [self layoutButtons];
    }
    else if (button.type == FXAlertButtonTypeCancel) {
        
        // If there's already a button added, delete
        // it and add the new button we want to add.
        if (self.buttons[cancelButtonKey]) {
            FXAlertButton *button = self.buttons[cancelButtonKey];
            button = nil;
        }
        
        // Add the new button.
        [self.buttons setObject:button forKey:cancelButtonKey];
        
        [self layoutButtons];
    }
    
    
}


- (void) layoutButtons {
    
    
// We have both a cancel and stadnard button to layout.
    if(self.buttons[standardButtonKey] && self.buttons[cancelButtonKey]) {
        
        FXAlertButton *standardButton = self.buttons[standardButtonKey];
        standardButton.frame = [self standardButtonRect];
        
        FXAlertButton *cancelButton = self.buttons[cancelButtonKey];
        cancelButton.frame = [self cancelButtonRect];
        
        [self.alertView addSubview:standardButton];
        [self.alertView addSubview:cancelButton];
        
    }
    else if (self.buttons[standardButtonKey]) { // Standard button on its own
        
        FXAlertButton *button = self.buttons[standardButtonKey];
        button.frame = [self singleButtonRect];
        
        [self.alertView addSubview: button];
        
    }
    else if(self.buttons[cancelButtonKey]) { // Cancel button on its own.
        
        FXAlertButton *button = self.buttons[cancelButtonKey];
        button.frame = [self singleButtonRect];
        [self.alertView addSubview: button];
        
    }
}


#pragma mark Rects for each kind of button.
- (CGRect)singleButtonRect {
    
    CGFloat buttonWidth = self.alertView.frame.size.width;
    CGFloat buttonHeight = self.alertView.frame.size.height * 0.2;
    
    return CGRectMake(0, self.alertView.frame.size.height - buttonHeight, buttonWidth, buttonHeight);
}

- (CGRect)standardButtonRect {

    CGFloat buttonWidth = self.alertView.frame.size.width * 0.5;
    CGFloat buttonHeight = self.alertView.frame.size.height * 0.2;
    
    return CGRectMake(0, self.alertView.frame.size.height - buttonHeight, buttonWidth, buttonHeight);
}


- (CGRect)cancelButtonRect {
    CGFloat buttonWidth = self.alertView.frame.size.width * 0.5;
    CGFloat buttonHeight = self.alertView.frame.size.height * 0.2;
    
    return CGRectMake(self.alertView.frame.size.width * 0.5, self.alertView.frame.size.height - buttonHeight, buttonWidth, buttonHeight);
}


@end