//
//  BMLaunchArguments.h
//
//  Created by Jeffrey Camealy on 2/19/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMLaunchArguments : NSObject

/*
 * Launch Arguments set in scheme can be retreived here
 */
+ (BOOL)boolForKey:(NSString *)key;

@end
