//
//  NSJSONSerialization+Utilities.m
//  Dryv-DryCleaners
//
//  Created by Jeffrey Camealy on 4/27/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "NSJSONSerialization+Utilities.h"

@implementation NSJSONSerialization (Utilities)

+ (NSString *)jsonStringForObject:(id)object {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                    options:NSJSONWritingPrettyPrinted
                                      error:nil];
    NSString *jsonString = [NSString.alloc initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
