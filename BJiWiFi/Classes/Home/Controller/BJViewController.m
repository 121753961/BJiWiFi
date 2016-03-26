//
//  BJViewController.m
//  BJiWiFi
//
//  Created by KuangBing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJViewController.h"

@interface BJViewController ()

@end

@implementation BJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kRandomColor;
    
    [self setNavBarView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ******** 设置导航条的View
-(void)setNavBarView{
    //CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *leftBarButton = [self navigationLeftBarButtonItem];
    leftBarButton.frame = CGRectMake(16.f, 20.f,leftBarButton.frame.size.width, leftBarButton.frame.size.height);
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    
    
    //    UIButton *rightBarButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth - 38.f,25.f, 25.f, 25.f)];
    //    [rightBarButton setImage:[UIImage imageNamed:@"ic_erweima"] forState:UIControlStateNormal];
    //    [rightBarButton addTarget:self action:@selector(qRcodeClick) forControlEvents:UIControlEventTouchUpInside];
    //    //[_navBarBottmView addSubview:rightBarButton];
}
// 导航条左边的View
-(UIView *)navigationLeftBarButtonItem{
    UIView *bv = [[UIView alloc] init];
    bv.frame = CGRectMake(0, 4, 120, 30);
    
    UIImageView *uesrIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tou_03"]];
    uesrIcon.frame = CGRectMake(-13, 0, 27, 27);
    [bv addSubview:uesrIcon];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(2, 0, 60, 30);
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"广州";
    label.textAlignment = UIBaselineAdjustmentAlignCenters;
    label.textColor = [UIColor whiteColor];
    [bv addSubview:label];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tof"]];
    img.frame = CGRectMake(52, 12, 12, 6);
    [bv addSubview:img];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 110, 30);
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [bv addSubview:backButton];
    
    return bv;
}


-(void)backButtonClick:(UIButton *)btn{
    BJLog(@"backButtonClick-------");
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    [UIView animateWithDuration:0.5 animations:^{
        if (CGAffineTransformIsIdentity(self.navigationController.view.transform)) {
            CGAffineTransform form =  CGAffineTransformMakeScale(0.8, 0.8);
            self.navigationController.view.transform = CGAffineTransformTranslate(form, screenWidth - 95, 0);
        }else{
            self.navigationController.view.transform = CGAffineTransformIdentity;
        }
    }];
    
}

@end
