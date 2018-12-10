//
//  SjjyyModel.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/19.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjyyModel.h"

@implementation YYAuthor
@end

@implementation SjjyyModel
#pragma mark ============ 1.自定义属性映射 ============

//custom属性，让 json key 映射到 对象的属性。  该方法在自
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"n",
             @"page" : @"p",
             @"desc" : @"ext.desc",                 //key.path
             @"bookID" : @[@"ID",@"id",@"book_id"]};
    //从 json 过来的key 可以是id，ID，book_id。例子中 key 为 id。
}


#pragma mark ============ 自定义容器映射 ============

//相当于泛型说明
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"authors" : [YYAuthor class]};
}
@end
