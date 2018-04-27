//
//  UIButton+skeleton.m
//  iTouzi
//
//  Created by EDZ on 2018/4/20.
//  Copyright © 2018年 itouzi. All rights reserved.
//

#import "UIButton+skeleton.h"
#import "UIView+skeleton.h"

@implementation UIButton (skeleton)

- (void)setIsSkeleton:(NSNumber *)isSkeleton {
    [super setIsSkeleton:isSkeleton];
    [self sendSubviewToBack:self.titleLabel];
}

- (void)endAnimal {
    [super endAnimal];
    [self bringSubviewToFront:self.titleLabel];
}

@end
