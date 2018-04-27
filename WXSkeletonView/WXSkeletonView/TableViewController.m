//
//  TableViewController.m
//  WXSkeletonView
//
//  Created by EDZ on 2018/4/19.
//  Copyright © 2018年 wangxiaoxuan. All rights reserved.
//

#import "TableViewController.h"
#import "WXSkeleton.h"

@interface cell : UITableViewCell

@end

@implementation cell

@end

@interface TableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, assign) BOOL isFirstLoading;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isFirstLoading = YES;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.isFirstLoading = NO;
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    if (!self.isFirstLoading) {
        [cell endAllSkeleton];
        self.titleLabel.text = @"123";
    }
    return cell;
}

@end
