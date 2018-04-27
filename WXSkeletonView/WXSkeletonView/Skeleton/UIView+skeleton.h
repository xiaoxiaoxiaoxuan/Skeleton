//
//  UIView+skeleton.h
//  WXSkeletonView
//
//  Created by EDZ on 2018/4/19.
//  Copyright © 2018年 wangxiaoxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SkeletonAnimationStyle) {
    SkeletonAnimationStyleSolid = 1,
    SkeletonAnimationStyleGradientHorizontal,
    SkeletonAnimationStyleGradientVertical,
    SkeletonAnimationStyleOblique
};
@interface UIView (skeleton)

@property (nonatomic, strong) NSNumber *isSkeleton;

@property (nonatomic, strong) UIView *skeletonView;

@property (strong, nonatomic) CAGradientLayer *skeletonAnimalLayer;

- (void)setupWithColor:(UIColor *)color
        animationStyle:(SkeletonAnimationStyle)style;

- (void)endAnimal;

- (void)endSkeleton;

@end
