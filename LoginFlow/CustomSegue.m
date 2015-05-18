//
//  CustomSegue.m
//  LoginFlow
//
//  Created by Angel Campiña on 15/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform {
    UIViewController *fromViewController = (UIViewController *)self.sourceViewController;
    UIViewController *toViewController = (UIViewController *)self.destinationViewController;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    [UIView animateWithDuration:0.5 animations:^{
        fromViewController.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        // Next line removes fromViewController from rootViewController and so its views from window.subviews
        window.rootViewController = toViewController;
    }];
}

@end
