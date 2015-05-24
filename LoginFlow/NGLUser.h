//
//  NGLUser.h
//  LoginFlow
//
//  Created by Angel Campiña on 22/05/15.
//  Copyright (c) 2015 Angel Campiña. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NGLUser : NSObject

@property (strong, nonatomic, readonly) NSString *user;
@property (strong, nonatomic, readonly) NSString *password;

@end
NS_ASSUME_NONNULL_END
