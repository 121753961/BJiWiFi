//
//  BJHomeHeaderCell.m
//  BJiWiFi
//
//  Created by kuangbing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJHomeHeaderCell.h"

@implementation BJHomeHeaderCell


+(NSString *)ID{
    return @"BJHomeHeaderCell";
}

+(id)myHomeHeaderCell{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    BJHomeHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:[BJHomeHeaderCell ID]];
    if (cell == nil) {
        cell = [BJHomeHeaderCell myHomeHeaderCell];
    }
    cell.backgroundColor = kColor(243, 243, 243);
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
