//
//  FXAlertButton.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "FXAlertButton.h"


@implementation FXAlertButton

#pragma mark Object Life Cycle.
- (instancetype) initWithType:(FXAlertButtonType) type {
    if (self = [super init]) {
        
        _type = type;
        
        if (_type == FXAlertButtonTypeStandard) {
            self.backgroundColor = [FXAlertButton standardColour];
        }
        else if (_type == FXAlertButtonTypeCancel) {
            self.backgroundColor = [FXAlertButton cancelColour];
        }
        
        self.titleLabel.minimumScaleFactor = 0.5;
    }
    return self;
}


#pragma Accessors for buttons colours.
+ (UIColor *)standardColour {
    return [UIColor colorWithRed:0.125 green:0.784 blue:0.392 alpha:1.0];
}

+ (UIColor *)cancelColour {
    return [UIColor colorWithWhite:0.8 alpha:1.0];
}

@end
