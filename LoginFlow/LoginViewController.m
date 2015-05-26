//
//  ViewController.m
//  LoginFlow
//
//  Created by Angel Campiña on 15/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "LoginViewController.h"
#import "UICKeyChainStore.h"
#import "UIView+NGLAnimations.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    __weak IBOutlet UITextField *_user;
    __weak IBOutlet UITextField *_password;
    UICKeyChainStore *_keyChain;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _keyChain = [UICKeyChainStore keyChainStoreWithService:@"com.campina.angel"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleTap:(id)sender {
    [self.view endEditing:YES];
}
// First action is called and then shouldPerformSegueWithIdentifier
- (IBAction)loginUser:(id)sender {
    [UIView tapAnimation:(UIView *)sender];
}

- (IBAction)registerUser:(id)sender {
    _keyChain[@"user"] = _user.text;
    _keyChain[@"password"] = _password.text;
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasLoginKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [UIView tapAnimation:(UIView *)sender];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // text fields delegate set on storyboard
    if (textField == _user) {
        [_password becomeFirstResponder];
    } else {
        if ([self shouldPerformSegueWithIdentifier:@"registeredUser" sender:self]) {
            // performSegueWithIdentifier sets endEditing to YES resigning the keyboard
            //[textField resignFirstResponder];
            [self performSegueWithIdentifier:@"registeredUser" sender:self];
        }
    }
    
    return YES;
}

- (BOOL)checkKeyChainUser:(NSString *)user password:(NSString *)password {
    return [user isEqualToString:_keyChain[@"user"]] && [password isEqualToString:_keyChain[@"password"]];
}

- (ACEmptyCredentials)isEmptyUser:(NSString *)user password:(NSString *)password {
    BOOL isEmptyUser = [user isEqualToString:@""];
    BOOL isEMptyPassword = [password isEqualToString:@""];
    
    if (isEmptyUser && isEMptyPassword) {
        return ACEmptyUserPassword;
    }
    
    if (isEmptyUser) {
        return ACEmptyUser;
    }
    
    if (isEMptyPassword) {
        return ACEmptyPassword;
    }
    
    return ACEmptyNone;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    ACEmptyCredentials credentials = [self isEmptyUser:_user.text password:_password.text];
    
    if (credentials != ACEmptyNone) {
        [self showAlertWithMessage:credentials];
        return NO;
    }
    
    if (![self checkKeyChainUser:_user.text password:_password.text]) {
        [self showAlertWithMessage:ACEmptyUserPassword];
        return NO;
    }
    
    [self.view endEditing:YES];
    return YES;
}

- (void)showAlertWithMessage:(ACEmptyCredentials)credentials {
    NSString *message;
    
    switch (credentials) {
        case ACEmptyNone:
            return;
            break;
        case ACEmptyUser:
            message = @"El nombre de usuario no puede estar en blanco";
            break;
        case ACEmptyPassword:
            message = @"La contraseña no puede estar en blanco";
            break;
        case ACEmptyUserPassword:
            message = @"El nombre de usuario y la contraseña no pueden estar en blanco";
            break;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"Cerrar"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alertController addAction:closeAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
