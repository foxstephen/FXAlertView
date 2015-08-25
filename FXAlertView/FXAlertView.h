//
//  FXAlertViewController.h
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

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
    RGB: 255-255-255
    HEX: FFFFFF
 */
@property (strong, nonatomic) UIColor *defaultColour;


/**
 Calling this method will cause the receiver
 to be presented to the view hierarchy.
 
 The presentation is animated and 
 will be added to the rootViewController.
 */
- (void) present;
@end
