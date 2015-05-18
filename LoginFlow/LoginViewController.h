//
//  ViewController.h
//  LoginFlow
//
//  Created by Angel Campiña on 15/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ACEmptyCredentials) {
    ACEmptyNone,
    ACEmptyUser,
    ACEmptyPassword,
    ACEmptyUserPassword
};

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@end

