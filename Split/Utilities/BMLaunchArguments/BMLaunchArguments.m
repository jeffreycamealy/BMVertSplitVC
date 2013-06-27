//
//  BMLaunchArguments.m
//
//  Created by Jeffrey Camealy on 2/19/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMLaunchArguments.h"

@implementation BMLaunchArguments

+ (BOOL)boolForKey:(NSString *)key {
    // Scheme Launch arguments are stored in NSUserDefaults by Xcode
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

@end
