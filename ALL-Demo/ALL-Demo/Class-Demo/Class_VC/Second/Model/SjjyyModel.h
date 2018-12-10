//
//  SjjyyModel.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/19.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYAuthor;

@interface SjjyyModel : NSObject
//自定义类的属性
@property NSString      *name;
@property NSInteger     page;
@property NSString      *desc;
@property NSString      *bookID;


@property UInt64        uid;
@property NSString      *bookname;
@property (nonatomic, strong)   NSMutableArray<YYAuthor *>    *authors;
@end

@interface YYAuthor : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSDate *birthday;
@end

/*
 {
 "uid":123456,
 "bookname":"Harry",
 "authors":[
 {
 "birthday":"1991-07-31T08:00:00+0800",
 "name":"G.Y.J.jeff"
 },
 {
 "birthday":"1990-07-31T08:00:00+0800",
 "name":"Z.Q.Y,jhon"
 }
 ]
 }
 
 链接：https://www.jianshu.com/p/79f52e42840f
 
 */
