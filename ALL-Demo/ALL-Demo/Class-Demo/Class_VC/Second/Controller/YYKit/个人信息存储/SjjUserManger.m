//
//  SjjUserManger.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/23.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjUserManger.h"

@implementation SjjUserManger

#pragma mark ============ 初始化工具类 ============

+(instancetype)shareUser{
    static SjjUserManger *userinfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userinfo = [[SjjUserManger alloc]init];
        
    });
    return userinfo;
}

@end
