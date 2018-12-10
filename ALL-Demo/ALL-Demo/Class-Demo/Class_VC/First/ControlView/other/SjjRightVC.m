//
//  SjjRightVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjRightVC.h"
#import "SjjMyorderList.h"
#import "UIViewController+CWLateralSlide.h"

@interface SjjRightVC ()

@end

@implementation SjjRightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     view的宽度应该设置  ScreenWidth *0.75
     */
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *btn= [[UIButton alloc]init];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(100);
        make.height.width.equalTo(@50);
    }];
}
-(void)push{
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    SjjMyorderList *listvc=[[SjjMyorderList alloc]init];
    listvc.title=@"我的订单";
    listvc.stuta=@"0";
//    [self.navigationController pushViewController:listvc animated:YES];
    [self cw_pushViewController:listvc];
    NSLog(@"ok");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 抽屉内push界面
//- (void)cw_pushViewController:(UIViewController *)viewController{
//    [self cw_pushViewController:viewController drewerHiddenDuration:0];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
