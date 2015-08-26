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
        
        if(_type == FXAlertButtonTypeStandard) {
            self.backgroundColor = [UIColor colorWithRed:0.125 green:0.784 blue:0.392 alpha:1.0];
        }
        else if (_type == FXAlertButtonTypeCancel) {
            self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
//            self.backgroundColor = [UIColor colorWithRed:0.886 green:0.215 blue:0.215 alpha:1.0];
            
        }

        [self.titleLabel setFont:[UIFont fontWithName:@"Avenir Next" size:18]];
        
        
    }
    return self;
}

@end
