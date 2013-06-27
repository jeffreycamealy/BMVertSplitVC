//
//  NSDateFormatter+Utilities.m
//  DRYV
//
//  Created by Jeffrey Camealy on 5/13/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "NSDateFormatter+Utilities.h"

@implementation NSDateFormatter (Utilities)

+ (NSDate *)dateWithCommonFormatString:(NSString *)dateString {
    NSDateFormatter *formatter = NSDateFormatter.new;
    formatter.dateFormat = @"M/d/yyyy h:mm a";
    return [formatter dateFromString:dateString];
}

@end
