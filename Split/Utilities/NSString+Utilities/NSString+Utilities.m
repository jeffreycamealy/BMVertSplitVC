//
//  NSString+Utilities.m
//  BatteryClub
//
//  Created by Jeffrey Camealy on 5/30/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)

- (BOOL)containsString:(NSString *)string {
    NSRange range = [self rangeOfString:string];
    BOOL found = (range.location != NSNotFound);
    return found;
}

@end
