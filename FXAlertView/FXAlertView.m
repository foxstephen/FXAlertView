//
//  FXAlertViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "FXAlertView.h"


@interface FXAlertView () <UIViewControllerTransitioningDelegate>{
    CGFloat screenWidth;
    CGFloat screenHeight;
    CGFloat buttonPadding;
    CGFloat alertTitlePadding;
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
        
        self.modalTransitionStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        
        screenWidth = [[UIScreen mainScreen] bounds].size.width;
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
        buttonPadding = 60;
        alertTitlePadding = 60;
        
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
                                                                alertTitlePadding)];
        _alertTitle.text = title;
        _alertTitle.textAlignment = NSTextAlignmentCenter;
        _alertTitle.textColor = [UIColor grayColor];
        _alertTitle.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:20];
        [_alertView addSubview:_alertTitle];
        
        
        _alertMessageTextView = [[UITextView alloc] initWithFrame:CGRectMake(0,
                                                                             _alertView.frame.size.height * 0.2,
                                                                             _alertView.frame.size.width,
                                                                             _alertView.frame.size.height - alertTitlePadding - buttonPadding)];
        [_alertMessageTextView setFont: [UIFont fontWithName:@"Avenir Next" size:25]];
        _alertMessageTextView.text = message;
        _alertMessageTextView.selectable = NO;
        _alertMessageTextView.editable = NO;
        _alertMessageTextView.textAlignment = NSTextAlignmentCenter;
        _alertMessageTextView.showsVerticalScrollIndicator = NO;

        _alertMessageTextView.textColor = [UIColor grayColor];
        [_alertMessageTextView sizeToFit];
        [_alertView addSubview:_alertMessageTextView];
        
        // Size the alert with the given subview.
        [self sizeAlert];
        
        _alertView.center = self.view.center;
        
    }
    return self;
}

// Sizes the alerts based on the alertTitle, alertMessageTextView and
// the buttons on the alert.
- (void) sizeAlert {
    
    CGFloat totalAlertViewHeight = _alertTitle.frame.size.height + _alertMessageTextView.frame.size.height + buttonPadding;
    
    // The largest possible size the alert can be.
    CGFloat largestAlertHeight = screenHeight - 60;
    
    
    // If totalAlertViewHeight is around the size of
    // the screen, it will need to be resized down.
    // We need to take into account the size of the
    // alertMessageTextView, the alertTitlePadding and button
    // paddings to acheive this.
    
    if (totalAlertViewHeight > screenHeight - 30) {
        
        // Shrink the size of the alertMessageView
        // to fit inside the newly sized alertView.
        self.alertMessageTextView.frame = CGRectMake(self.alertMessageTextView.frame.origin.x,
                                                 self.alertMessageTextView.frame.origin.y,
                                                 self.alertMessageTextView.frame.size.width,
                                                 self.alertMessageTextView.frame.size.height - buttonPadding * 3);
        
        self.alertView.frame = CGRectMake(self.alertView.frame.origin.x,
                                          self.alertView.frame.origin.y,
                                          self.alertView.frame.size.width,
                                          largestAlertHeight);
    }
    else {
        
        // Just size the alert according to it's contents.
        self.alertView.frame = CGRectMake(self.alertView.frame.origin.x,
                                          self.alertView.frame.origin.y,
                                          self.alertView.frame.size.width,
                                          totalAlertViewHeight);
    }
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
        
        // If there's already a "standard button" added, remove it
        // from superView and set to nil.
        if (self.buttons[standardButtonKey]) {

            FXAlertButton *button = self.buttons[standardButtonKey];
            [button removeFromSuperview];
            button = nil;
        }
        
        // Add the new button.
        [self.buttons setObject:button forKey:standardButtonKey];

        [self layoutButtons];
    }
    else if (button.type == FXAlertButtonTypeCancel) {
        
        // If there's already a "cancel button" added, remove it
        // from superView and set to nil.
        if (self.buttons[cancelButtonKey]) {
            FXAlertButton *button = self.buttons[cancelButtonKey];
            [button removeFromSuperview];
            button = nil;
        }
        
        // Add the new button.
        [self.buttons setObject:button forKey:cancelButtonKey];
        
        [self layoutButtons];
    }
    
    
}



- (void) layoutButtons {
    
    
    // We have both a cancel and standard button to layout.
    if(self.buttons[standardButtonKey] && self.buttons[cancelButtonKey]) {
        
        FXAlertButton *standardButton = self.buttons[standardButtonKey];
        standardButton.frame = [self standardButtonRect];
        
        FXAlertButton *cancelButton = self.buttons[cancelButtonKey];
        cancelButton.frame = [self cancelButtonRect];
        
        [self.alertView addSubview:standardButton];
        [self.alertView addSubview:cancelButton];
        
    }
    else if (self.buttons[standardButtonKey]) { /* Standard button on its own */
        
        FXAlertButton *button = self.buttons[standardButtonKey];
        button.frame = [self singleButtonRect];
        
        [self.alertView addSubview: button];
        
    }
    else if(self.buttons[cancelButtonKey]) { /* Cancel button on its own.*/
        
        FXAlertButton *button = self.buttons[cancelButtonKey];
        button.frame = [self singleButtonRect];
        [self.alertView addSubview: button];
        
    }
}



#pragma mark Rects for each kind of button.
- (CGRect)singleButtonRect {
    
    CGFloat buttonWidth = self.alertView.frame.size.width;
    CGFloat buttonHeight = buttonPadding;
    
    return CGRectMake(0, self.alertView.frame.size.height - buttonHeight, buttonWidth, buttonHeight);
}

- (CGRect)standardButtonRect {

    CGFloat buttonWidth = self.alertView.frame.size.width * 0.5;
    CGFloat buttonHeight = buttonPadding;
    
    return CGRectMake(0, self.alertView.frame.size.height - buttonHeight, buttonWidth, buttonHeight);
}


- (CGRect)cancelButtonRect {
    CGFloat buttonWidth = self.alertView.frame.size.width * 0.5;
    CGFloat buttonHeight = buttonPadding;
    
    return CGRectMake(self.alertView.frame.size.width * 0.5, self.alertView.frame.size.height - buttonHeight, buttonWidth, buttonHeight);
}

#pragma Mutator methods
- (void)setFont:(UIFont *)font {
    _font = font;
    [self updateSubViewsWithUIChanges];
}


- (void) updateSubViewsWithUIChanges {
    
}

@end