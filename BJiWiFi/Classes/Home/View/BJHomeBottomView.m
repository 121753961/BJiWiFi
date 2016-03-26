//
//  BJHomeBottomView.m
//  BJiWiFi
//
//  Created by kuangbing on 16/2/24.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJHomeBottomView.h"

@implementation BJHomeBottomView

+(id)myHomeBottomView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

@end
