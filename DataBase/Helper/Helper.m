//
//  Helper.m
//  GenderTimerPro
//
//  Created by Mac User12 on 01/04/15.
//  Copyright (c) 2015 iossolution. All rights reserved.
//

#import "Helper.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#import <UIKit/UIKit.h>
@implementation Helper


+(BOOL)validateEmailWithString:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
+(void)globalAlert:(NSString*)msg{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Database Practical" message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}
@end