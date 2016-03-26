//
//  BJHomeCellTool.m
//  BJiWiFi
//
//  Created by kuangbing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import "BJHomeCellTool.h"
#import "BJHomeCell.h"
#import "BJHomeHeaderCell.h"
#import "BJHomeAdCell.h"
#import "BJHomeItmesModel.h"

@implementation BJHomeCellTool

/*
 * 每行的 Cell
 */
+(UITableViewCell *)HomeCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath ItemsModel:(BJHomeItmesModel *)itemsModel{
    if (indexPath.section == 0) {
        return [BJHomeAdCell cellWithTableView:tableView];
    }else{
        BJHomeCell *homeCell = [BJHomeCell cellWithTableView:tableView];
        homeCell.itemsModel = itemsModel;
        return homeCell;
    }
}

/*
 * 每行 Cell 的高
 */
+(CGFloat)cellHeight:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0) {
        return 200;
    }else{
        return 90;
    }
}


/*
 * 第一行的头部
 */
+(UITableViewCell *)headerWithTableView:(UITableView *)tableView Section:(NSInteger)section{
    return [BJHomeHeaderCell cellWithTableView:tableView];
}

@end
