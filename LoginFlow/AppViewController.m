//
//  AppViewController.m
//  LoginFlow
//
//  Created by Angel Campiña on 15/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import "AppViewController.h"
#import "UICKeyChainStore.h"

@implementation AppViewController
// shouldPerformSegueWithIdentifier ??
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UICKeyChainStore *_keyChain = [UICKeyChainStore keyChainStoreWithService:@"com.campina.angel"];
    _keyChain[@"user"] = nil;
    _keyChain[@"password"] = nil;
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hasLoginKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
