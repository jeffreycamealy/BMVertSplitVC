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
#define ExpandContractDuration 0.2

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
        [self addTopTapRecognizer];
    }
    return self;
}


#pragma mark - Public API

// Subclass Can Override
- (void)backViewWillExpand {}
- (void)backViewWillContract {}


#pragma mark - Private API

- (void)addChildVCs {
    // backVC
    [self addChildViewController:self.backVC];
    [self.view addSubview:self.backVC.view];
    
    self.backVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraintForSubview:self.backVC.view visualFormat:@"H:|[backView]|"];
    
    dockedConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backView(150)]"
                                                                                   options:0
                                                                                   metrics:nil
                                                                                     views:@{@"backView": self.backVC.view}];
    [self.view addConstraints:dockedConstraints];
    
    [self.backVC didMoveToParentViewController:self];
    
    
    // frontVC
    [self addChildViewController:self.frontVC];
    [self.view addSubview:self.frontVC.view];
    
    self.frontVC.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraintForSubview:self.frontVC.view visualFormat:@"H:|[frontView]|"];
    NSDictionary *views = @{@"backView": self.backVC.view,
                            @"frontView": self.frontVC.view};
    [self.view addConstraintsForViews:views visualFormat:@"V:[backView][frontView]|"];
    
    [self.frontVC didMoveToParentViewController:self];
}

- (void)addTopTapRecognizer {
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
    [UIView animateWithDuration:ExpandContractDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
    
    [self backViewWillExpand];
}

- (void)contractBackView {
    [self.view removeConstraints:expandedConstraints];
    [self.view addConstraints:dockedConstraints];
    [UIView animateWithDuration:ExpandContractDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
    [self backViewWillContract];
}

@end

































