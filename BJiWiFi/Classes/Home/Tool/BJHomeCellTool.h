//
//  BJHomeCellTool.h
//  BJiWiFi
//
//  Created by kuangbing on 16/2/21.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BJHomeItmesModel;

@interface BJHomeCellTool : NSObject

/*
 * 每行 Cell
 */
+(UITableViewCell *)HomeCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath ItemsModel:(BJHomeItmesModel *)itemsModel;

/*
 * 每行 Cell 的高
 */
+(CGFloat)cellHeight:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;



/*
 * 第一行的头部
 */
+(UITableViewCell *)headerWithTableView:(UITableView *)tableView Section:(NSInteger)section;


@end
