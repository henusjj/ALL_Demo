//
//  Sjjaddress.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/2.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "Sjjaddress.h"
#import "SjjtianjiaAddress.h"
@interface Sjjaddress ()

@end

@implementation Sjjaddress

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * item =[[UIBarButtonItem alloc]initWithTitle:@"添加地址" style:UIBarButtonItemStylePlain target:self action:@selector(rightbtn)];
    self.navigationItem.rightBarButtonItem = item;
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 200)];
    lable.text=@"点击添加地址，回调block，刷新数据";
    [self.view addSubview:lable];
    
    
}

-(void)load{
    
}
//重写bcak返回按钮
-(void)backAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)rightbtn{
    SjjtianjiaAddress *vc = [[SjjtianjiaAddress alloc]init];
    vc.title = @"添加地址";
    WS(weakSelf);
    vc.back = ^{
        [MBProgressHUD showSuccess:@"回调没有参数的"];
    };
    
    vc.state = ^(NSInteger state) {
        [MBProgressHUD showSuccess:[NSString stringWithFormat:@"回调带参数的block%ld",state]];
    };
    [self.navigationController pushViewController:vc animated:YES];
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
