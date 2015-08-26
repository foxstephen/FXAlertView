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
    if(self = [super init]) {
        
        _type = type;
        
        self.backgroundColor = [UIColor greenColor];
        [self.titleLabel setFont:[UIFont fontWithName:@"Avenir Next" size:18]];
        
        
    }
    return self;
}

@end
