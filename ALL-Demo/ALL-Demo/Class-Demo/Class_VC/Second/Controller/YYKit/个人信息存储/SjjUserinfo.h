//
//  SjjUserinfo.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/23.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SjjUserinfo : NSObject
//用户基本信息
@property(nonatomic,copy)NSString *name,*userId,*phone;

@property(nonatomic,strong)NSNumber *sex;

@end
