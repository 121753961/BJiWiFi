//
//  BJNavigationController.m
//  BJiWiFi
//
//  Created by KuangBing on 16/2/21.
//  Copyright © 2016年 Kunagbing. All rights reserved.
//

#import "BJNavigationController.h"

@implementation BJNavigationController

+(void)initialize{
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    [appearance setBackgroundImage:[UIImage imageNamed:@"navBar"] forBarMetrics:UIBarMetricsDefault];
    
    //[appearance setBackgroundColor:kColor(244, 101, 0)];

}

@end
