//
//  LaunchScreenSegue.m
//  LoginFlow
//
//  Created by Angel Campiña on 16/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "LaunchScreenSegue.h"

@implementation LaunchScreenSegue
{
    UIView *_view;
}

- (instancetype)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination {
    self = [super initWithIdentifier:identifier source:source destination:destination];
    
    if (self) {
        // default duration - value in seconds
        _duration = 0.25;
    }
    
    return self;
}

- (void)perform {
    UIViewController *sourceViewController = (UIViewController *)self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController *)self.destinationViewController;
    
    _view = [destinationViewController.view snapshotViewAfterScreenUpdates:YES];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:_view aboveSubview:sourceViewController.view];
    
    CGFloat centerX = CGRectGetMidX(_view.frame);
    CGFloat centerY = CGRectGetMidY(_view.frame);
    CGRect initialRect = CGRectMake(centerX, centerY, 0.0, 0.0);
    UIBezierPath *circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:initialRect];
    
    CGFloat width = CGRectGetWidth(_view.frame);
    CGFloat height = CGRectGetHeight(_view.frame);
    float radius = sqrtf(width * width + height * height) / 2;
    CGRect finalRect = CGRectInset(initialRect, -radius, -radius);
    UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:finalRect];

    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = circleMaskPathFinal.CGPath;
    _view.layer.mask = mask;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"path"];
    animation.fromValue = (__bridge id)(circleMaskPathInitial.CGPath);
    animation.toValue = (__bridge id)(circleMaskPathFinal.CGPath);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = _duration;
    animation.delegate = self;
    
    [mask addAnimation:animation forKey:@"path"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *destinationViewController = (UIViewController *)self.destinationViewController;
    // Next line removes fromViewController from rootViewController and so its views from window.subviews
    window.rootViewController = destinationViewController;
    [_view removeFromSuperview];
}

@end
