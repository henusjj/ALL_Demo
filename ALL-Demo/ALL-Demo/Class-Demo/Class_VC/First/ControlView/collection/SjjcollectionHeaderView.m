//
//  SjjcollectionHeaderView.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjcollectionHeaderView.h"

@implementation SjjcollectionHeaderView


/* 注册了顶部视图后，当缓存池中没有顶部视图的对象时候，自动调用alloc/initWithFrame创建 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UILabel *lable = [[UILabel alloc]init];
        lable.frame = CGRectMake(5, 5, frame.size.width-10, frame.size.height-10);
        lable.numberOfLines = 0;
        lable.textAlignment = NSTextAlignmentLeft;
        
        [self addSubview:lable];
        self.text=lable;
        
    }
    return self;
}
@end
