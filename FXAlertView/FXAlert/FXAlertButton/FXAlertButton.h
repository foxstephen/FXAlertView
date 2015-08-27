//
//  FXAlertButton.h
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FXAlertButtonType) {
    FXAlertButtonTypeStandard, // This would be something like an okay button.
    FXAlertButtonTypeCancel // This would be something like a cancel button.
};

@class FXAlertButton;

@protocol FXAlertButtonDelegate <NSObject>

- (void) fxAlertButton:(FXAlertButton *) button wasPressed:(BOOL) pressed;

@end
@interface FXAlertButton : UIButton


@property (nonatomic, weak) id<FXAlertButtonDelegate> delegate;

/**
 The button type of an instance.
 */
@property (nonatomic, readonly) FXAlertButtonType type;


/**
 Creates a new instance of FXAlertButton.
 
 @param type The type of button to create.
 */
- (instancetype) initWithType:(FXAlertButtonType) type;


/**
 The standard button colour.
 */
+ (UIColor *) standardColour;

/**
 The cancel button colour.
 */
+ (UIColor *) cancelColour;
@end
