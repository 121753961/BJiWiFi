//
//  BJHomeCell.h
//  BJiWiFi
//
//  Created by kuangbing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BJHomeItmesModel;

@interface BJHomeCell : UITableViewCell


+(id)myHomeCell;

+(NSString *)ID;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) BJHomeItmesModel *itemsModel;

@property (weak, nonatomic) IBOutlet UIImageView *img;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *personPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UILabel *businesscircleLabel;

@end
