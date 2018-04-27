//
//  UIView+skeleton.m
//  WXSkeletonView
//
//  Created by EDZ on 2018/4/19.
//  Copyright © 2018年 wangxiaoxuan. All rights reserved.
//

#import "UIView+skeleton.h"
#import <objc/runtime.h>

#define SkeletonColorFromRGBA(R, G, B, A) \
[UIColor  colorWithRed:(R)/255.0 \
green:(G)/255.0 \
blue:(B)/255.0 \
alpha:1.0]
#define SkeletonColorFromRGB(R, G, B)       SkeletonColorFromRGBA(R, G, B, 1.0)
#define SkeletonNormalColor                 SkeletonColorFromRGB(230.0, 230.0, 230.0)
static const CGFloat kShadowWidth = 60;
@implementation UIView (skeleton)

- (void)setSkeletonAnimalLayer:(CAGradientLayer *)skeletonAnimalLayer {
    objc_setAssociatedObject(self, @"skeletonAnimalLayer", skeletonAnimalLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAGradientLayer *)skeletonAnimalLayer {
    return objc_getAssociatedObject(self, @"skeletonAnimalLayer");
}

- (void)setSkeletonView:(UIView *)skeletonView {
    objc_setAssociatedObject(self, @"skeletonView", skeletonView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)skeletonView {
    return objc_getAssociatedObject(self, @"skeletonView");
}

- (void)setIsSkeleton:(NSNumber *)isSkeleton {
    objc_setAssociatedObject(self, @"isSkeleton", isSkeleton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (isSkeleton.boolValue) {
        if (!self.skeletonView) {
            self.skeletonView = [[UIView alloc] initWithFrame:self.bounds];
            [self addSubview:self.skeletonView];
            self.skeletonView.userInteractionEnabled = NO;
            [self setAnimalColor];
        }
        [self setupWithColor:SkeletonNormalColor animationStyle:SkeletonAnimationStyleOblique];
    }
}

- (NSNumber *)isSkeleton {
    return objc_getAssociatedObject(self, @"isSkeleton");
}


- (void)setupWithColor:(UIColor *)color
         animationStyle:(SkeletonAnimationStyle)style {
    self.layer.masksToBounds = YES;
    self.skeletonView.backgroundColor = color;
    [self animateWithanimationStyle:style];
}

- (void)endAnimal {
    [self.skeletonAnimalLayer removeAllAnimations];
}

- (void)endSkeleton {
    self.skeletonAnimalLayer = nil;
    [self.skeletonView.layer removeAllAnimations];
    [self.skeletonView removeFromSuperview];
    self.skeletonView = nil;
}

- (void)animateWithanimationStyle:(SkeletonAnimationStyle)style{
    CGSize size = self.skeletonView.bounds.size;
    switch (style) {
        case SkeletonAnimationStyleSolid:{
            CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"opacity"];
            basic.fromValue = @1.;
            basic.toValue = @0.5;
            basic.duration = 2.;
            basic.repeatCount = INFINITY;
            basic.autoreverses = YES;
            basic.removedOnCompletion = NO;
            [self.skeletonView.layer addAnimation:basic forKey:basic.keyPath];
            break;
        }
        case SkeletonAnimationStyleGradientHorizontal:{
            CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"position"];
            basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(-kShadowWidth/2., size.height/2.)];
            basic.toValue = [NSValue valueWithCGPoint:CGPointMake(size.width+kShadowWidth/2., size.height/2.)];
            basic.duration = 1.5;
            basic.repeatCount = INFINITY;
            basic.removedOnCompletion = NO;
            self.skeletonAnimalLayer.frame = CGRectMake(0, 0, kShadowWidth, size.height);
            self.skeletonAnimalLayer.startPoint = CGPointMake(0, 0.5);
            self.skeletonAnimalLayer.endPoint = CGPointMake(1, 0.5);
            [self.skeletonAnimalLayer addAnimation:basic forKey:basic.keyPath];
            break;
        }
        case SkeletonAnimationStyleGradientVertical:{
            CGFloat height = size.height/2. > 40. ? : 40.;
            CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"position"];
            basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(size.width/2., -height)];
            basic.toValue = [NSValue valueWithCGPoint:CGPointMake(size.width/2., size.height+height)];
            basic.duration = 1.5;
            basic.repeatCount = INFINITY;
            basic.removedOnCompletion = NO;
            self.skeletonAnimalLayer.frame = CGRectMake(0,0,size.width,height);
            self.skeletonAnimalLayer.startPoint = CGPointMake(0.5, 0);
            self.skeletonAnimalLayer.endPoint = CGPointMake(0.5, 1);
            [self.skeletonAnimalLayer addAnimation:basic forKey:basic.keyPath];
            break;
        }
        case SkeletonAnimationStyleOblique:{
            CABasicAnimation * basic = [CABasicAnimation animationWithKeyPath:@"position"];
            basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(-kShadowWidth, size.height/2.)];
            basic.toValue = [NSValue valueWithCGPoint:CGPointMake(size.width+kShadowWidth, size.height/2.)];
            basic.duration = 1.5;
            basic.repeatCount = INFINITY;
            basic.removedOnCompletion = NO;
            self.skeletonAnimalLayer.affineTransform = CGAffineTransformMakeRotation(0.4);
            self.skeletonAnimalLayer.frame = CGRectMake(0, 0, kShadowWidth, size.height+200);
            self.skeletonAnimalLayer.startPoint = CGPointMake(0, 0.5);
            self.skeletonAnimalLayer.endPoint = CGPointMake(1, 0.5);
            [self.skeletonAnimalLayer addAnimation:basic forKey:basic.keyPath];
            break;
        }
        default:
            break;
    }
}

-(void)setAnimalColor{
    if (self.skeletonAnimalLayer == nil) {
        self.skeletonAnimalLayer = [CAGradientLayer layer];
        [self.skeletonView.layer addSublayer:self.skeletonAnimalLayer];
        UIColor * color = [UIColor whiteColor];
        self.skeletonAnimalLayer.colors = @[(id)[color colorWithAlphaComponent:0.03].CGColor,
                                            (id)[color colorWithAlphaComponent:0.09].CGColor,
                                            (id)[color colorWithAlphaComponent:0.15].CGColor,
                                            (id)[color colorWithAlphaComponent:0.21].CGColor,
                                            (id)[color colorWithAlphaComponent:0.27].CGColor,
                                            (id)[color colorWithAlphaComponent:0.30].CGColor,
                                            (id)[color colorWithAlphaComponent:0.27].CGColor,
                                            (id)[color colorWithAlphaComponent:0.21].CGColor,
                                            (id)[color colorWithAlphaComponent:0.15].CGColor,
                                            (id)[color colorWithAlphaComponent:0.09].CGColor,
                                            (id)[color colorWithAlphaComponent:0.03].CGColor];
    }
}

@end
