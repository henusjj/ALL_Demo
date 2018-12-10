//
//  SjjcollectionModel.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/7.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjcollectionModel.h"
#import "Sjjtwomodel.h"
@implementation SjjcollectionModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"data":[Sjjtwomodel class]};
}
@end
