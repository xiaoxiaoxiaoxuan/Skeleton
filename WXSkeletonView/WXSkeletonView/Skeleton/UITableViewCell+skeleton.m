//
//  UITableViewCell+skeleton.m
//  WXSkeletonView
//
//  Created by EDZ on 2018/4/19.
//  Copyright © 2018年 wangxiaoxuan. All rights reserved.
//

#import "UITableViewCell+skeleton.h"

@implementation UITableViewCell (skeleton)

- (void)endAllSkeleton {
    [self findSubView:self.contentView];
    self.userInteractionEnabled = YES;
    // tableView 可滑动
    UITableView *tableView = (UITableView *)self;
    if([tableView isKindOfClass:[UITableView class]]) {
        tableView.scrollEnabled = YES;
    }
}

/**
 * cell 上所有 skelen 的 view 停止
 */
-(void)findSubView:(UIView*)view {
    for (UIView *sview in view.subviews) {
        if (sview.isSkeleton.boolValue) {
            [sview endSkeleton];
        }
        [self findSubView:sview];
    }
}

@end
