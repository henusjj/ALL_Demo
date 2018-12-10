//
//  SjjlayerVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/2.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjlayerVC.h"
#import "PJ_DeletePopView.h"

@interface SjjlayerVC ()

@end

@implementation SjjlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 300, 30)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"点击出现蒙版，自定义视图" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnclick{
    /*
     UIView类可以自定义
     */
    
    PJ_DeletePopView *popview = [[PJ_DeletePopView alloc]initWithTitle:@"提示" subTile:@"确认修改密码吗？" leftBtnTitle:@"取消" rightBtnTitle:@"确认" clickBlock:^(NSInteger clickIndex) {
        if (clickIndex == 0) {//取消
            [MBProgressHUD showError:@"取消按钮"];
        }else{
            [MBProgressHUD showSuccess:@"确认按钮"];
        }
    }];
    [popview show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
