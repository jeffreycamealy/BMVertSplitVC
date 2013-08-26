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
    id<MASConstraint> contractedConstraint;
    id<MASConstraint> expandedConstraint;
    BOOL backViewIsExpanded;
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
    [self.backVC didMoveToParentViewController:self];
    
    [self.backVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.top.equalTo(self.view.top);
        contractedConstraint = make.height.equalTo(@(SplitPoint));
    }];
    
    
    // frontVC
    [self addChildViewController:self.frontVC];
    [self.view addSubview:self.frontVC.view];
    [self.frontVC didMoveToParentViewController:self];
    
    [self.frontVC.view makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left);
        make.right.equalTo(self.view.right);
        make.top.equalTo(self.backVC.view.bottom);
        make.bottom.equalTo(self.view.bottom);
    }];
}

- (void)addTopTapRecognizer {
    UITapGestureRecognizer *tapRecognizer = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(backViewWasTapped:)];
    [self.backVC.view addGestureRecognizer:tapRecognizer];
}

- (void)backViewWasTapped:(UIGestureRecognizer *)tapRecognizer {
    if (backViewIsExpanded) return;
    
    [self backViewWillExpand];
    
    [contractedConstraint uninstall];

    [self.backVC.view makeConstraints:^(MASConstraintMaker *make) {
        expandedConstraint = make.bottom.equalTo(self.view.bottom);
    }];
    
    [UIView animateWithDuration:ExpandContractDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         backViewIsExpanded = YES;
                     }];
}

- (void)contractBackView {
    if (!backViewIsExpanded) return;
    
    [self backViewWillContract];
    [expandedConstraint uninstall];
    [contractedConstraint install];
    
    [UIView animateWithDuration:ExpandContractDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         backViewIsExpanded = NO;
                     }];
}

@end

































