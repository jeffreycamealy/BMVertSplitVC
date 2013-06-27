//
//  UIView+FrameManipulations.m
//  BMUtilityPack
//
//  Created by Jeffrey Camealy on 4/20/12.
//  Copyright (c) 2012 bearMountain. All rights reserved.
//

#import "UIView+FrameManipulations.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (FrameManipulations)

#pragma mark - Move View

- (void)offsetXBy:(float)offset {
    self.frame = CGRectMake(self.frame.origin.x+offset, self.frame.origin.y, 
                            self.frame.size.width, self.frame.size.height);
}

- (void)offsetYBy:(float)offset {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y+offset, 
                            self.frame.size.width, self.frame.size.height);
}

- (void)offsetXBy:(float)xOffset offsetYBy:(float)yOffset {
    self.frame = CGRectMake(self.frame.origin.x+xOffset, self.frame.origin.y+yOffset, 
                            self.frame.size.width, self.frame.size.height);
}


#pragma mark - Set Frame Attributes

- (void)setFrameOriginX:(float)originX {
    self.frame = CGRectMake(originX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameOriginY:(float)originY {
    self.frame = CGRectMake(self.frame.origin.x, originY, self.frame.size.width, self.frame.size.height);
}

- (void)setFrameHeight:(float)height {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

- (void)setFrameWidth:(float)width {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (void)offsetHeightBy:(float)height {
    [self setFrameHeight:self.frame.size.height+height];
}

- (void)offsetWidthBy:(float)width {
    [self setFrameWidth:self.frame.size.width+width];
}


#pragma mark - Anchor

- (void)normalizeForAnchorChange {
    float changeX = self.layer.anchorPoint.x - 0.5;
    float changeY = self.layer.anchorPoint.y - 0.5;
    float changePointsX = self.frame.size.width * changeX;
    float changePointsY = self.frame.size.height * changeY;
    self.layer.position = CGPointMake(self.layer.position.x+changePointsX, self.layer.position.y+changePointsY);
}

@end

































