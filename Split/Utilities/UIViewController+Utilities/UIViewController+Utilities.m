//
//  UIViewController+Utilities.m
//  BatteryClub
//
//  Created by Jeffrey Camealy on 5/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "UIViewController+Utilities.h"

@implementation UIViewController (Utilities)

- (void)presentViewController:(UIViewController *)viewControllerToPresent {
    [self presentViewController:viewControllerToPresent animated:YES];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag {
    [self presentViewController:viewControllerToPresent animated:flag completion:nil];
}


- (void)dismissViewController {
    [self dismissViewControllerAnimated:YES];
}

- (void)dismissViewControllerAnimated:(BOOL)flag {
    [self dismissViewControllerAnimated:flag completion:nil];
}

@end
