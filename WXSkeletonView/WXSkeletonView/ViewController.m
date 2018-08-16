//
//  ViewController.m
//  WXSkeletonView
//
//  Created by EDZ on 2018/4/19.
//  Copyright © 2018年 wangxiaoxuan. All rights reserved.
//

#import "ViewController.h"
#import "WXSkeleton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *sview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.sview.isSkeleton.boolValue ? @"YES":@"NO");
    NSLog(@"%@", @"123");
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonAction:(id)sender {
    [_sview endSkeleton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
