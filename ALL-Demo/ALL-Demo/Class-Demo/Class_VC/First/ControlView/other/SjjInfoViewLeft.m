//
//  SjjInfoViewLeft.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjInfoViewLeft.h"
#import "SjjLeftVC.h"
#import "SjjRightVC.h"
#import "SjjNavigationController.h"
//导入抽屉效果分类
#import "UIViewController+CWLateralSlide.h"

@interface SjjInfoViewLeft ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation SjjInfoViewLeft

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"仿qq侧滑";
//    弹出按钮
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(leftInfo)];
    self.navigationItem.rightBarButtonItem = right;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];

}
-(void)leftInfo{
    SjjLeftVC *vc = [[SjjLeftVC alloc]init];
    /**
     根控制器可偏移的距离，默认为屏幕的0.75
     */
    [self cw_showDrawerViewController:vc animationType:CWDrawerAnimationTypeDefault configuration:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        cell.textLabel.text=@"点击rightBar,左侧抽屉效果";//默认屏幕的0.7
    }else{
        cell.textLabel.text=@"点击cell,左侧抽屉效果";//缩小版
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        SjjRightVC *vc = [[SjjRightVC alloc]init];
        SjjNavigationController *nav = [[SjjNavigationController alloc]initWithRootViewController:vc];
        CWLateralSlideConfiguration *conf = [CWLateralSlideConfiguration configurationWithDistance:0 maskAlpha:0.4 scaleY:0.4 direction:CWDrawerTransitionFromLeft backImage:[UIImage imageNamed:@"0.jpg"]];
        
        [self cw_showDrawerViewController:nav animationType:CWDrawerAnimationTypeDefault configuration:conf];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
