//
//  BJHomeResultModel.h
//  BJiWiFi
//
//  Created by KuangBing on 16/2/22.
//  Copyright © 2016年 KuangBing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJHomeResultModel : NSObject

@property(nonatomic, copy) NSString *code;

@property(nonatomic, copy) NSString *message;

@property(nonatomic, strong) NSArray *resultJson;

@end
