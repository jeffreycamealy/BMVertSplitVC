//
//  BMLog.m
//  BatteryClub
//
//  Created by Jeffrey Camealy on 5/24/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "BMLog.h"

NSString *bm_limitStringToLines(NSUInteger lines, NSString *string) {
    NSArray *stringLines = [string componentsSeparatedByCharactersInSet:NSCharacterSet.newlineCharacterSet];
    NSArray *limitedLines = [stringLines subarrayWithRange:NSMakeRange(0, lines)];
    NSString *limitedString = [limitedLines componentsJoinedByString:@"\n"];
    return str(@"%@\n...",limitedString);
}