//
//  KWKeychainTool.m
//  科汛网校
//
//  Created by 林 on 2019/3/26.
//  Copyright © 2019年 Kesion. All rights reserved.
//

#import "KWKeychainTool.h"
#import "SAMKeychain.h" 
#import "SAMKeychainQuery.h"

#define ServiceName     UserMessageUrlStr 
#define Account         @"UUID"

@implementation KWKeychainTool
+ (NSString *)getUUID { 
    NSString *password = [SAMKeychain passwordForService:ServiceName account:Account];
    
    if (!password) {
        password = [[[UIDevice currentDevice] identifierForVendor] UUIDString];  
        if ([SAMKeychain setPassword:password forService:ServiceName account:Account]) { 
            NSLog(@"success !"); 
        }
    }   
//    NSArray *keys = [SSKeychain accountsForService:ServiceName]; 
    return password;
}
@end
