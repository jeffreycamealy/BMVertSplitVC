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

@interface BMVertSplitVC (){
    NSArray *dockedConstraints;
    NSArray *expandedConstraints;
}
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
    // backVC
    [self addChildViewController:self.backVC];
    [self.view addSubview:self.backVC.view];
    
    self.backVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraintForSubview:self.backVC.view visualFormat:@"H:|[view]|"];
    
    dockedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view(150)]"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:@{@"view": self.backVC.view}];
    [self.view addConstraints:dockedConstraints];
//    [self.view addConstraintForSubview:self.backVC.view visualFormat:@"V:|[view(150)]"];
    
    [self.backVC didMoveToParentViewController:self];
    
    
    // frontVC
    [self addChildViewController:self.frontVC];
    [self.view addSubview:self.frontVC.view];
    
    self.frontVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraintForSubview:self.frontVC.view visualFormat:@"H:|[view]|"];
    NSDictionary *views = @{@"backView": self.backVC.view, @"frontView": self.frontVC.view};
    [self.view addConstraintsForViews:views visualFormat:@"V:[backView][frontView]|"];
    
    [self.frontVC didMoveToParentViewController:self];
    
//    NSLog(@"view: %@", self.frontVC.view);
//    NSLog(@"vert: %@", [self.frontVC.view constraintsAffectingLayoutForAxis:UILayoutConstraintAxisVertical]);
    
    UITapGestureRecognizer *tapRecognizer = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(backViewWasTapped:)];
    [self.backVC.view addGestureRecognizer:tapRecognizer];
}

- (void)backViewWasTapped:(UIGestureRecognizer *)tapRecognizer {
    [self.view removeConstraints:dockedConstraints];
    expandedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backView]|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:@{@"backView": self.backVC.view}];
    [self.view addConstraints:expandedConstraints];
    [UIView animateWithDuration:1
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

@end

































