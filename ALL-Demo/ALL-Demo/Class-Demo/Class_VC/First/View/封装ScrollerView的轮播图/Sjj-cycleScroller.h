//
//  Sjj-cycleScroller.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/20.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Sjj_cycleScroller;

@protocol CycleScrollViewDelegate <NSObject>
/*
 点击图片回调
 */

-(void)cycleScroller:(Sjj_cycleScroller *)cycleScrollerView didSelectItemAtIndex:(NSInteger)index;

@end


@interface Sjj_cycleScroller : UIView
//代理方法
@property(nonatomic,weak)id <CycleScrollViewDelegate>delegate;

//初始化方法
-(instancetype)initWithFrame:(CGRect)frame imageGroups:(NSArray<NSString *> *)imageGroups;
@end
