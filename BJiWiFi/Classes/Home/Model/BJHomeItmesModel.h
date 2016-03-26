//
//  BJHomeItmesModel.h
//  BJiWiFi
//
//  Created by KuangBing on 16/2/22.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJHomeItmesModel : NSObject

@property(nonatomic, copy) NSString *ID;

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *address;

@property(nonatomic, copy) NSString *logo;

@property(nonatomic, copy) NSString *photo;

@property(nonatomic, copy) NSString *region;

/**  类型名称 */
@property(nonatomic, copy) NSString *typeName;

@property(nonatomic, copy) NSString *businesscircle;

/**  评分 */
@property(nonatomic,copy) NSString *rating;

/**  评分人数 */
@property(nonatomic,copy) NSString *personPay;





@end
