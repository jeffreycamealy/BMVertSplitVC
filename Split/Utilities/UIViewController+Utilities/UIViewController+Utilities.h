//
//  UIViewController+Utilities.h
//  BatteryClub
//
//  Created by Jeffrey Camealy on 5/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utilities)

- (void)presentViewController:(UIViewController *)viewControllerToPresent;
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag;

- (void)dismissViewController;
- (void)dismissViewControllerAnimated:(BOOL)flag;

@end
