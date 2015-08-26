//
//  FXAlertViewController.h
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXAlertButton.h"

@interface FXAlertView : UIViewController

/**
 Initialises a new instance with a title
 and message set.
 
 @param title   The title of the alert.
 @param message The message of the alert.
 
 @return New instance
 */
- (instancetype) initWithTitle:(NSString *) title message:(NSString *) message;





/**
 Sets the color of the alertView.
 
 The default colour of the alertView is white. ([UIColor whiteColor])
    RGB: 255255255
    HEX: FFFFFF
 */
@property (strong, nonatomic) UIColor *defaultColour;





/**
 Adds a button to the receiver. The sizing and positioning of the buttons
 is handled internally by the FXAlertView class.
 
 Each instance of FXAlertView can only have two buttons at a time.
 A "Standard" button (left side) and a "Cancel" button (right side).

 - If there is one button on the view it will take up the whole
   width of the alert. 
 - If there is two buttons on the view, they will each share half the width
   of the FXAlertView instance.
 
 @param button An instance of FXAlertButton.
 */
- (void) addButton:(FXAlertButton *) button;





/**
 Calling this method will cause the receiver
 to be presented to the view hierarchy.
 
 The presentation is animated and 
 will be added to the rootViewController.
 */
- (void) present;
@end
