//
//  UINavigationController+Utilities.m
//  BatteryClub
//
//  Created by Jeffrey Camealy on 5/28/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "UINavigationController+Utilities.h"

@implementation UINavigationController (Utilities)

- (void)pushViewController:(UIViewController *)viewController {
    [self pushViewController:viewController animated:YES];
}

- (void)popViewController {
    [self popViewControllerAnimated:YES];
}

@end
