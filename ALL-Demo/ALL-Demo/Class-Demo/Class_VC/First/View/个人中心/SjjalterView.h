//
//  SjjalterView.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/3.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SjjalterView : UIView
/**
 arrytitle:脚部视图从上到下排
 */
+(UIView *)creatAlterView:(UIViewController *)view andtitle:(NSArray *)arrytitle delegate:(id)delegate;
@end
