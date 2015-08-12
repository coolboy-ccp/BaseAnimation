//
//  MyDefineAnimation.m
//  BaseAnimation
//
//  Created by liqunfei on 15/8/12.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "MyDefineAnimation.h"

@implementation MyDefineAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] insertSubview:toViewController.view aboveSubview:fromViewController.view];
    toViewController.view.transform = CGAffineTransformMakeTranslation(320, 568);
    [UIView animateWithDuration:.5 animations:^{
        toViewController.view.transform = CGAffineTransformMakeScale(0.3, 0.3);
        toViewController.view.transform = CGAffineTransformRotate(toViewController.view.transform, M_PI/3);
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            fromViewController.view.alpha = 0.5;
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            fromViewController.view.transform = CGAffineTransformIdentity;
            fromViewController.view.alpha = 1.0;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }];
}


@end
