//
//  NSMutableArray+Utilities.m
//  Dryv-DryCleaners
//
//  Created by Jeffrey Camealy on 4/25/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "NSMutableArray+Utilities.h"

@implementation NSMutableArray (Utilities)

- (void)filterUsingBlock:(BOOL(^)(id obj))filterBlock {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return filterBlock(evaluatedObject);
    }];
    [self filterUsingPredicate:predicate];
}

@end
