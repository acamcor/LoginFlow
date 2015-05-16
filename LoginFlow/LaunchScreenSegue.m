//
//  LaunchScreenSegue.m
//  LoginFlow
//
//  Created by Angel Campiña on 16/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "LaunchScreenSegue.h"

@implementation LaunchScreenSegue

- (void)perform {
    UIViewController *fromViewController = (UIViewController *)self.sourceViewController;
    UIViewController *toViewController = (UIViewController *)self.destinationViewController;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:toViewController.view aboveSubview:fromViewController.view];
    
    CGPoint center = toViewController.view.center;
    CGRect initialRect = CGRectMake(center.x, center.y, 0.0, 0.0);
    UIBezierPath *circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:initialRect];
    
    CGFloat width = toViewController.view.frame.size.width;
    CGFloat height = toViewController.view.frame.size.height;
    float radius = sqrtf(width * width + height * height) / 2;
    CGRect finalRect = CGRectInset(initialRect, -radius, -radius);
    UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:finalRect];
    
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = circleMaskPathFinal.CGPath;
    toViewController.view.layer.mask = mask;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"path"];
    animation.fromValue = (__bridge id)(circleMaskPathInitial.CGPath);
    animation.toValue = (__bridge id)(circleMaskPathFinal.CGPath);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 0.25;
    animation.delegate = self;
    
    [mask addAnimation:animation forKey:@"path"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *toViewController = (UIViewController *)self.destinationViewController;
    window.rootViewController = toViewController;
}

@end
