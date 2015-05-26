//
//  LaunchScreenViewController.m
//  LoginFlow
//
//  Created by Angel Campiña on 15/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "LaunchScreenViewController.h"
#import "LaunchScreenSegue.h"

@interface LaunchScreenViewController ()

@end

@implementation LaunchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    BOOL hasLoginKey = [[NSUserDefaults standardUserDefaults] boolForKey:@"hasLoginKey"];
    
    if (hasLoginKey) {
        [self performSegueWithIdentifier:@"app" sender:self];
    } else {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

- (IBAction)toLogin:(id)sender {
    [self performSegueWithIdentifier:@"login" sender:self];
    
}

- (IBAction)toApp:(id)sender {
    [self performSegueWithIdentifier:@"app" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LaunchScreenSegue *launchScreenSegue = (LaunchScreenSegue *)segue;
    launchScreenSegue.duration = 0.5;
}


@end
