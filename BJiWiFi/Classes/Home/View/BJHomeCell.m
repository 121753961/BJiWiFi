//
//  BJHomeCell.m
//  BJiWiFi
//
//  Created by kuangbing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJHomeCell.h"
#import "BJHomeItmesModel.h"

@implementation BJHomeCell


+(NSString *)ID{
    return NSStringFromClass([self class]);
}

+(id)myHomeCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    BJHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[BJHomeCell ID]];
    if (cell == nil) {
        cell = [BJHomeCell myHomeCell];
    }
    return cell;
}

-(void)setItemsModel:(BJHomeItmesModel *)itemsModel{
    _itemsModel = itemsModel;
    NSString *str = [NSString stringWithFormat:@"http://w.iwifi.com%@",itemsModel.logo];
    NSURL *url = [NSURL URLWithString:str];
    [_img sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"no_shop_logo_m"]];
    
    _nameLabel.text = itemsModel.name;
    
    // 评分
    _ratingLabel.text = [NSString stringWithFormat:@"%@分",itemsModel.rating];
    
    _personPayLabel.text = [NSString stringWithFormat:@"￥%@/人",itemsModel.personPay];
    
    _typeNameLabel.text = itemsModel.typeName;
    
    _regionLabel.text = [NSString stringWithFormat:@"%dkm",arc4random() % 100];
    
    _businesscircleLabel.text = itemsModel.businesscircle;

}
    

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
