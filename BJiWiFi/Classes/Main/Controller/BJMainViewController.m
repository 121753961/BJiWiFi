//
//  BJMainViewController.m
//  BJiWiFi
//
//  Created by KuangBing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJMainViewController.h"
#import "BJHomeViewController.h"
#import "BJNavigationController.h"

@interface BJMainViewController ()

@property (nonatomic, strong) BJHomeViewController *homeVC;

@end

@implementation BJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BJLog(@"---BJMainViewController---");
    
    //创建
    BJHomeViewController *homeVC = [[BJHomeViewController alloc] init];
    self.homeVC = homeVC;
    
    BJNavigationController *newNav = [[BJNavigationController alloc] initWithRootViewController:self.homeVC];
    [self.view addSubview:newNav.view];
    
    [self addChildViewController:newNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 *  设置stausbar 的状态
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



@end
