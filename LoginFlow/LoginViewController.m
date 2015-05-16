//
//  ViewController.m
//  LoginFlow
//
//  Created by Angel Campiña on 15/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    __weak IBOutlet UITextField *user;
    __weak IBOutlet UITextField *password;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSwipe:(id)sender {
    [self performSegueWithIdentifier:@"launch" sender:sender];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // text fields delegate set on storyboard
    if (textField == user) {
        [password becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self performSegueWithIdentifier:@"registeredUser" sender:self];
    }
    
    return YES;
}

@end
