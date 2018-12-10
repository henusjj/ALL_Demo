//
//  SjjUserManger.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/23.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SjjUserManger : NSObject
//用户基本信息
@property(nonatomic,copy)NSString *name,*userId,*phone;

@property(nonatomic,strong)NSNumber *sex;


/*
 通过单例模式对工具类进行初始化
 */

+(instancetype)shareUser;


/*
 通过单例模式对工具类进行初始化
 */

+(void)confing:(NSDictionary *)inforDic;


/*
  存入所需要的登录状态数据
 */

-(void)saveUserAllMessages;


/*
 删除所需要的登录状态数据
 */

-(void)removeUserAllMessages;


@end
