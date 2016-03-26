//
//  BJHomeAdCell.m
//  BJiWiFi
//
//  Created by kuangbing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJHomeAdCell.h"

@implementation BJHomeAdCell

+(NSString *)ID{
    return NSStringFromClass([self class]);
}

+(id)myHomeAdCell{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    BJHomeAdCell *cell = [tableView dequeueReusableCellWithIdentifier:[BJHomeAdCell ID]];
    if (cell == nil) {
        cell = [BJHomeAdCell myHomeAdCell];
    }
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
