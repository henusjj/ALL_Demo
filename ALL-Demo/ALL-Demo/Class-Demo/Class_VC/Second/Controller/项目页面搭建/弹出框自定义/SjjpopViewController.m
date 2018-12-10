//
//  SjjpopViewController.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/11.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjpopViewController.h"
#import "CommanBottomPopView.h"

@interface SjjpopViewController ()
@property(nonatomic,strong)UIView *customView;
@property(nonatomic,strong)CommanBottomPopView *popBgView;
@end

@implementation SjjpopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"弹出框";
    UIButton *btn=[[UIButton alloc]init];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:15];
    btn.backgroundColor=[UIColor blueColor];
    [btn addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.mas_equalTo(100);
    }];
}

-(void)popView{
    self.customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-40, 200)];
    self.customView.backgroundColor = [UIColor redColor];
    self.popBgView = [CommanBottomPopView bottomPopWithCustomView:self.customView positionState:PositionStateCenter];
    [self.popBgView show];
    
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
