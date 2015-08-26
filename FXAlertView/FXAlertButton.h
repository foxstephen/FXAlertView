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

@interface FXAlertButton : UIButton


@property (nonatomic, readonly) FXAlertButtonType type;



- (instancetype) initWithType:(FXAlertButtonType) type;


@end
