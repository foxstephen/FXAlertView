//
//  FXAlertViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "FXAlertController.h"
#import "FXAlertViewTransitionAnimator.h"

@interface FXAlertController () < FXAlertButtonDelegate, UIViewControllerTransitioningDelegate>{
    CGFloat screenWidth;
    CGFloat screenHeight;
    CGFloat buttonPadding; // The height required for the buttons to fit on the alert.
    CGFloat alertTitlePadding; // The height required for the alert title label to fit on the alert.
}


@property (strong, nonatomic) UIView *alertView;
@property (strong, nonatomic) UILabel *alertTitleLabel;
@property (strong, nonatomic) UITextView *alertMessageTextView;
@property (strong, nonatomic) NSMutableDictionary *buttons;

@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *messageText;

@property (nonatomic, readonly) CGRect singleButtonRect; // Used if theres only one button on the view.
@property (nonatomic, readonly) CGRect standardButtonRect; // Used if there's two buttons added to the view.
@property (nonatomic, readonly) CGRect cancelButtonRect; // Used if there's two buttons added to the view.

@end

@implementation FXAlertController

// Keys for accessing each type of button.
NSString *const FXStandardButtonKey = @"standardButton";
NSString *const FXCancelButtonKey = @"cancelButton";


#pragma mark Object Life Cycle.
- (instancetype) initWithTitle:(NSString *) title message:(NSString *) message {
    
    if (self = [super init]) {
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        self.modalTransitionStyle = UIModalPresentationCustom;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.transitioningDelegate = self;
        
        screenWidth = [[UIScreen mainScreen] bounds].size.width;
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
        buttonPadding = 60;
        alertTitlePadding = 60;
        
        // Set default attributes.
        _font = [UIFont fontWithName:@"Avenir Next" size:18];
        _titleFont = [UIFont fontWithName:@"AvenirNext-DemiBold" size:20];
        _defaultColour = [UIColor whiteColor];
        _standardButtonColour = [FXAlertButton standardColour];
        _cancelButtonColour = [FXAlertButton cancelColour];
        
        _titleText = title;
        _messageText = message;


        [self setupAlertView];
        
    }
    return self;
}



- (void) setupAlertView {
    
    // AlertView
    _alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth * 0.8, screenHeight * 0.52)];
    _alertView.layer.masksToBounds = YES;
    _alertView.layer.cornerRadius = 4.0;
    _alertView.backgroundColor = _defaultColour;
    _alertView.center = self.view.center;
    [self.view addSubview:_alertView];
    
    // Alert title label
    _alertTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                            0,
                                                            _alertView.frame.size.width,
                                                            alertTitlePadding)];
    _alertTitleLabel.text = self.titleText;
    _alertTitleLabel.textAlignment = NSTextAlignmentCenter;
    _alertTitleLabel.textColor = [UIColor grayColor];
    _alertTitleLabel.font = _titleFont;
    [_alertView addSubview:_alertTitleLabel];
    
    
    // Alert message text view
    _alertMessageTextView = [[UITextView alloc] initWithFrame:CGRectMake(0,
                                                                         _alertView.frame.size.height * 0.2,
                                                                         _alertView.frame.size.width,
                                                                         _alertView.frame.size.height - alertTitlePadding - buttonPadding)];
    
    _alertMessageTextView.font = _font;
    _alertMessageTextView.text = self.messageText;
    _alertMessageTextView.selectable = NO;
    _alertMessageTextView.editable = NO;
    _alertMessageTextView.textAlignment = NSTextAlignmentCenter;
    _alertMessageTextView.textColor = [UIColor grayColor];
    [_alertView addSubview:_alertMessageTextView];
    
    
    // Size the alert with the given subviews.
    [self sizeAlert];
    
    _alertView.center = self.view.center;
}




- (void) addButton:(FXAlertButton*) button {

    if(!self.buttons) {
        self.buttons = [[NSMutableDictionary alloc] initWithCapacity:2];
    }
    
    // If any UIChanges for the buttons
    // handled by this class have been
    // custom set. Assign here.
    button.titleLabel.font = self.font;
    button.type == FXAlertButtonTypeStandard ?
        button.backgroundColor = self.standardButtonColour: self.cancelButtonColour;
    button.delegate = self;
    
    
    if (button.type == FXAlertButtonTypeStandard) {
        
        // If there's already a "standard button" added, remove it
        // from superView and set to nil.
        if (self.buttons[FXStandardButtonKey]) {

            FXAlertButton *button = self.buttons[FXStandardButtonKey];
            [button removeFromSuperview];
            button = nil;
        }
        
        // Add the new button.
        [self.buttons setObject:button forKey:FXStandardButtonKey];

        [self layoutButtons];
    }
    else if (button.type == FXAlertButtonTypeCancel) {
        
        // If there's already a "cancel button" added, remove it
        // from superView and set to nil.
        if (self.buttons[FXCancelButtonKey]) {
            FXAlertButton *button = self.buttons[FXCancelButtonKey];
            [button removeFromSuperview];
            button = nil;
        }
        
        // Add the new button.
        [self.buttons setObject:button forKey:FXCancelButtonKey];
        
        [self layoutButtons];
    }
    
    
}



- (void) layoutButtons {
    
    // We have both a cancel and standard button to layout.
    if (self.buttons[FXStandardButtonKey] && self.buttons[FXCancelButtonKey]) {
        
        FXAlertButton *standardButton = self.buttons[FXStandardButtonKey];
        standardButton.frame = [self standardButtonRect];
        
        FXAlertButton *cancelButton = self.buttons[FXCancelButtonKey];
        cancelButton.frame = [self cancelButtonRect];
        
        [self.alertView addSubview:standardButton];
        [self.alertView addSubview:cancelButton];
        
    }
    else if (self.buttons[FXStandardButtonKey]) { /* Standard button on its own */
        
        FXAlertButton *button = self.buttons[FXStandardButtonKey];
        button.frame = [self singleButtonRect];
        
        [self.alertView addSubview: button];
        
    }
    else if(self.buttons[FXCancelButtonKey]) { /* Cancel button on its own.*/
        
        FXAlertButton *button = self.buttons[FXCancelButtonKey];
        button.frame = [self singleButtonRect];
        [self.alertView addSubview: button];
        
    }
}


- (void)fxAlertButton:(FXAlertButton *)button wasPressed:(BOOL)pressed {
    if (pressed) {
        [self dismissViewControllerAnimated:YES completion:nil];
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

- (void) setFont:(UIFont *)font {
    _font = font;
    
    // Change the standard button font.
    if (self.buttons[FXStandardButtonKey] != nil) {
        FXAlertButton *button = (FXAlertButton *)self.buttons[FXStandardButtonKey];
        button.titleLabel.font = _font;
    }
    
    // Change the cancel button font.
    if (self.buttons[FXCancelButtonKey] != nil) {
        FXAlertButton *button = (FXAlertButton *)self.buttons[FXCancelButtonKey];
        button.titleLabel.font = _font;
    }
    
    // Change the alert message font.
    self.alertMessageTextView.font = _font;
}




- (void) setTitleFont:(UIFont *) titleFont {
    _titleFont = titleFont;
    self.alertTitleLabel.font = _titleFont;
}



- (void) setStandardButtonColour:(UIColor *)standardButtonColour {
    _standardButtonColour = standardButtonColour;
    
    if (self.buttons[FXStandardButtonKey] != nil) {
        FXAlertButton* button = self.buttons[FXStandardButtonKey];
        button.backgroundColor = _standardButtonColour;
    }
    
}


- (void) setCancelButtonColour:(UIColor *)cancelButtonColour {
    _cancelButtonColour = cancelButtonColour;
    
    if (self.buttons[FXCancelButtonKey] != nil) {
        FXAlertButton* button = self.buttons[FXCancelButtonKey];
        button.backgroundColor = _cancelButtonColour;
    }
}





#pragma Helper methods for sizing the alertView.

// Sizes the alerts based on the alertTitle, alertMessageTextView and
// the buttons on the alert.
- (void) sizeAlert {

    [self.alertMessageTextView sizeToFit];
    
    // The max possible height the alert can be.
    CGFloat maxAlertHeight = screenHeight - 80;
    
    // The max possible height message can be.
    CGFloat maxMessageHeight = maxAlertHeight - buttonPadding - alertTitlePadding;
    
    // Used to determine whether the alert needs to be resize.
    // If totalAlerViewHeight > maxAlertHeight ? resize: dont Resize
    CGFloat totalAlertViewHeight = _alertTitleLabel.frame.size.height + _alertMessageTextView.frame.size.height + buttonPadding;
    
    
    // If totalAlertViewHeight is around the size of
    // the screen, it will need to be resized down.
    // We need to take into account the size of the
    // alertMessageTextView, the alertTitlePadding and button
    // paddings to acheive this.
    if (totalAlertViewHeight > screenHeight - 30) {
        
        self.alertView.frame = CGRectMake(self.alertView.frame.origin.x,
                                          self.alertView.frame.origin.y,
                                          self.alertView.frame.size.width,
                                          maxAlertHeight);
        
        
        // Shrink the size of the alertMessageView
        // to fit inside the newly sized alertView.
        self.alertMessageTextView.frame = CGRectMake(0,
                                                     alertTitlePadding,
                                                     self.alertView.frame.size.width,
                                                     maxMessageHeight);
    }
    else {
        
        // Just size the alert according to it's contents.
        self.alertView.frame = CGRectMake(self.alertView.frame.origin.x,
                                          self.alertView.frame.origin.y,
                                          self.alertView.frame.size.width,
                                          totalAlertViewHeight);
        
        
        // Although the height doesn't need to be changed
        // the width will need to be set back to the full
        // width of the alertView as calling -sizeToFit
        // will have descreased the size.
        self.alertMessageTextView.frame = CGRectMake(0,
                                                     alertTitlePadding,
                                                     self.alertView.frame.size.width,
                                                     self.alertMessageTextView.frame.size.height);
        
        // Turn scroll off for the messageTextView as
        // all its content can be shown
        self.alertMessageTextView.scrollEnabled = NO;
        
    }
}


#pragma mark <UIViewControllerTransitionDelegate>
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    FXAlertViewTransitionAnimator *animator = [FXAlertViewTransitionAnimator new];
    animator.presenting = YES;
    return animator;
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    FXAlertViewTransitionAnimator* animator = [FXAlertViewTransitionAnimator new];
    animator.presenting = NO;
    return animator;
}
@end