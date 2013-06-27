//
//  UIAlertView+Convenience.m
//  Dryv-DryCleaners
//
//  Created by Jeffrey Camealy on 4/18/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "UIAlertView+Convenience.h"

@implementation UIAlertView (Convenience)

+ (void)errorWithMessage:(NSString *)message {
    [[UIAlertView.alloc initWithTitle:@"Error"
                              message:message
                             delegate:nil
                    cancelButtonTitle:@"Dismiss"
                    otherButtonTitles:nil] show];
}

@end
