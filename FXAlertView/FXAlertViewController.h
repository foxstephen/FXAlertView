//
//  FXAlertViewController.h
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXAlertViewController : UIViewController

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
 
 The default colour of the alertView is
    RGB: --
    HEX: --
 */
@property (strong, nonatomic) UIColor *defaultColour;

@end
