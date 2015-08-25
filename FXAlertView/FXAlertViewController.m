//
//  FXAlertViewController.m
//  FXAlertView
//
//  Created by Stephen Fox on 25/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "FXAlertViewController.h"

@interface FXAlertViewController () {
    CGFloat screenWidth;
    CGFloat screenHeight;
}

@property (strong, nonatomic) UIView *alertView;
@property (strong, nonatomic) UILabel *alertTitle;
@property (strong, nonatomic) UILabel *alertMessage;

@end

@implementation FXAlertViewController

#pragma mark Object Life Cycle.
- (instancetype) initWithTitle:(NSString *) title message:(NSString *) message {
    
    if(self = [super init]) {
        
        screenWidth = [[UIScreen mainScreen] bounds].size.width;
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
        
        _defaultColour = [UIColor greenColor];
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        
        _alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth * 0.8, 300)];
        _alertView.layer.cornerRadius = 4.0;
        _alertView.backgroundColor = _defaultColour;
        _alertView.center = self.view.center;
        [self.view addSubview:_alertView];
        
        
        _alertTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _alertView.frame.size.width, _alertView.frame.size.height * 0.2)];
        _alertTitle.text = title;
        _alertTitle.textAlignment = NSTextAlignmentCenter;
        _alertTitle.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:20];
        [_alertView addSubview:_alertTitle];
    }
    return self;
}


@end