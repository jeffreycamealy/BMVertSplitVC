//
//  BMLog.h
//  BatteryClub
//
//  Created by Jeffrey Camealy on 5/24/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BMLog(format, ...) NSLog(format, ##__VA_ARGS__)

#define BMLimitLog(lines, format, ...) NSLog(@"%@", \
    bm_limitStringToLines(lines, [NSString stringWithFormat:format, ##__VA_ARGS__]))

NSString *bm_limitStringToLines(NSUInteger lines, NSString *string);
