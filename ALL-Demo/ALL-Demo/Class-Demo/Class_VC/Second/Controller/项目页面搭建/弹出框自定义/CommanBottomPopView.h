//
//  CommanBottomPopView.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/11.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PositionState) {
    PositionStateCenter,
    PositionStateBottom,
};
@interface CommanBottomPopView : UIView
+ (instancetype)bottomPopWithCustomView:(UIView *)customView positionState:(PositionState)state;
-(void)show;
@end
