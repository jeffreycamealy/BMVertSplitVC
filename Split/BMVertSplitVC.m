//
//  BMVertSplitVC.m
//  Split
//
//  Created by Jeffrey Camealy on 6/27/13.
//  Copyright (c) 2013 orainteractive. All rights reserved.
//

#import "BMVertSplitVC.h"
#import "UIView+AutoLayout.h"

#define SplitPoint 150

@interface BMVertSplitVC ()

@end

@implementation BMVertSplitVC

#pragma mark - Init Method

- (id)initWithBackVC:(UIViewController *)backVC frontVC:(UIViewController *)frontVC {
    if (self = [super init]) {
        _backVC = backVC;
        _frontVC = frontVC;
        [self addChildVCs];
    }
    return self;
}


#pragma mark - Private API

- (void)addChildVCs {
    [self addChildViewController:self.backVC];
    [self.view addSubview:self.backVC.view];
    
    self.backVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraintForSubview:self.backVC.view withVisualFormat:@"H:|[view]|"];
    [self.view addConstraintForSubview:self.backVC.view withVisualFormat:@"V:|[view(150)]"];
    
    [self.backVC didMoveToParentViewController:self];
}

@end
