//
//  UIView+NGLAnimations.m
//  LoginFlow
//
//  Created by Angel Campiña on 24/5/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "UIView+NGLAnimations.h"

@implementation UIView (NGLAnimations)

+ (void)tapAnimation:(UIView *)view {
    [UIView animateWithDuration:0.15
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         view.transform = CGAffineTransformMakeScale(0.8, 0.8);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.45
                                               delay:0.0
                              usingSpringWithDamping:0.3
                               initialSpringVelocity:0.0
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                          }
                                          completion:nil
                          ];
                     }
     ];
}

@end
