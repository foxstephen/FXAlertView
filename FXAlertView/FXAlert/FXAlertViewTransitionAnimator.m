//
//  FXAlertViewTransitionAnimator.m
//  FXAlertView
//
//  Created by Stephen Fox on 27/08/2015.
//  Copyright (c) 2015 Stephen Fox. All rights reserved.
//

#import "FXAlertViewTransitionAnimator.h"
#import "FXAlertController.h"


@implementation FXAlertViewTransitionAnimator


- (void) animateTransition:(id<UIViewControllerContextTransitioning>) transitionContext {
    
    FXAlertController *destinationViewController = (FXAlertController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    [transitionContext.containerView addSubview:destinationViewController.view];
    destinationViewController.view.frame = CGRectOffset(destinationViewController.view.frame, 0, -300);

    
    if (self.isPresenting) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0.4
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             destinationViewController.view.center = transitionContext.containerView.center;
                         }
                         completion:^(BOOL completed){
                             if (completed) {
                                 self.presenting = NO;
                                 [transitionContext completeTransition:YES];
                                 
                             }

                         }
         ];

    }
    
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}


@end
