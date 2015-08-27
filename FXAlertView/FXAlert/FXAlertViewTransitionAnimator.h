//
//  FXAlertViewTransitionAnimator.h
//  FXAlertView
//
//  Created by Stephen Fox on 27/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXAlertViewTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic, getter=isPresenting) __block BOOL presenting;

@end
