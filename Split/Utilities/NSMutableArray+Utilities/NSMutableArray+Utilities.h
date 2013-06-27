//
//  NSMutableArray+Utilities.h
//  Dryv-DryCleaners
//
//  Created by Jeffrey Camealy on 4/25/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Utilities)

/*
 * Removes objects whose filterBlock returns false
 *
 * Usage:
 *   [myMutableArray filterWithBlock:(id obj)^{
 *        return obj.intValue > 2;
 *    }];
 *
 */
- (void)filterUsingBlock:(BOOL(^)(id obj))filterBlock;

@end
