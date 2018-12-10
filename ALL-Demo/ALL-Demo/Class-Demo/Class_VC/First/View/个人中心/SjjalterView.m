//
//  SjjalterView.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/3.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjalterView.h"

@implementation SjjalterView
+(UIView *)creatAlterView:(UIViewController *)vc andtitle:(NSArray *)arrytitle delegate:(id)delegate{
    UIView *viewMeng = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    viewMeng.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.4];
    
    UIView *viewsheet=[[UIView alloc]init];
    viewsheet.backgroundColor=[UIColor whiteColor];
    [viewMeng addSubview:viewsheet];
    
    [viewsheet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(viewMeng.mas_bottom).offset(0);
        make.left.right.equalTo(viewMeng);
        make.height.mas_equalTo((arrytitle.count*45)+10);
    }];
    for (int i =0 ; i<arrytitle.count; i++) {
        UIButton *btn =[[UIButton alloc]init];
        [btn setTitle:arrytitle[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:13];
        btn.tag=i+1;
        [btn addTarget:[self getCurrentVC] action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
       
        if (i == 2) {
            UIView *line = [[UIView alloc]init];
            line.backgroundColor = VGColor(204, 204, 205);
            [viewMeng addSubview:line];
            [viewsheet addSubview:btn];

            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(viewMeng);
                make.bottom.equalTo(viewMeng.mas_bottom).offset(-45);
                make.height.mas_equalTo(10);
            }];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(viewsheet);
                make.height.mas_equalTo(45);
            }];
        }else{
            [viewsheet addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(viewsheet);
                make.top.equalTo(viewsheet).offset(45*i);
                make.height.mas_equalTo(45);
            }];
        }
        
    }
   
    return viewMeng;
}

+ (UIViewController *)getCurrentVC
{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    NSLog(@"-- %@ --",result);
    
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result topViewController];
    }
    NSLog(@"-- %@ --",result);
    return result;
}

@end
