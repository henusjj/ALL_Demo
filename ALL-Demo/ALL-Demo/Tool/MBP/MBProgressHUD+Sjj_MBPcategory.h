//
//  MBProgressHUD+Sjj_MBPcategory.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/29.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Sjj_MBPcategory)
//分类方法
+(void)showSuccess:(NSString *)success;
+(void)showSuccess:(NSString *)success toView:(UIView *)view;

+(void)showError:(NSString *)error;
+(void)showError:(NSString *)error toView:(UIView *)view;

+(MBProgressHUD *)showMessage:(NSString *)message;
+(MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+(void)hideHUD;
+(void)hideHUDForView:(UIView *)view;
@end
