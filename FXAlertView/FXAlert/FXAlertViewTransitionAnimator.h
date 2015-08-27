//
//  FXAlertViewTransitionAnimator.h
//  FXAlertView
//
//  Created by Stephen Fox on 27/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 This class implements 'UIViewControllerAnimatedTransitioning' protocol
 which provides an interface for FXAlertController upon presentation into 
 and out of a UIViewController.
 */
@interface FXAlertViewTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic, getter=isPresenting) __block BOOL presenting;

@end
