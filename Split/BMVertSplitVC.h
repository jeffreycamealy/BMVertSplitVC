//
//  BMVertSplitVC.h
//  Split
//
//  Created by Jeffrey Camealy on 6/27/13.
//  Copyright (c) 2013 orainteractive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMVertSplitVC : UIViewController

- (id)initWithBackVC:(UIViewController *)backVC frontVC:(UIViewController *)frontVC;

@property (readonly) UIViewController *backVC;
@property (readonly) UIViewController *frontVC;

@end
