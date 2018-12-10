//
//  First_VC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/5/30.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "First_VC.h"
#import "SjjMyCell.h"
#import "SjjscrollerView.h"
#import "SjjHeaderViewController.h"

#import "LYSSlideMenuController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FiveViewController.h"
#import "FourViewController.h"
#import "SjjNavBarTitielScroller.h"

#import "SjjInfoViewLeft.h"

#import "SjjMyorderList.h"
#import "SjjMBPVC.h"

#import "SjjMYinfoVC.h"
#import "SjjlayerVC.h"
#import "SjjCamersAddphotol.h"
#import "SjjTimer.h"
#import "SjjcollectionVC.h"
@interface First_VC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)NSArray *arrylist;
@end

@implementation First_VC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title=@"我的";
    [self creatUI];
    
    
}

-(void)creatUI{
    //已经懒加载了tableView,此处直接加上
    self.tableView.dataSource=self;
    self.tableView.delegate = self;
    
    self.tableView.showsVerticalScrollIndicator = NO;//不显示右侧滑块
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;//分割线
    
    [self.view addSubview:self.tableView];
    
//     注册自定义cell
//     第二种注册Cell<纯手工打造的HomeVC>
//     [self.tableView registerClass:[SjjMyCell class]forCellReuseIdentifier:@"cellid"];
    
    
    _arrylist=[[NSArray alloc]init];
    _arrylist = @[@"封装Scrollview轮播图",@"标签轮播",@"给UIView添加滚动",@"NavBarTitielScroller",@"仿qq点击出现个人信息",@"实用案例-我的订单",@"MBP使用",@"SVProgressHUD",@"个人中心",@"工具类蒙版",@"系统调用相册和相机",@"定时器",@"collectionVC"];
        
}

#pragma Table_view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;//组
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrylist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
//    取消cell的选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _arrylist[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        Scrollview
        SjjscrollerView *vc = [[SjjscrollerView alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){
        
        LYSSlideMenuController *slideMenu = [[LYSSlideMenuController alloc] init];
        slideMenu.title=@"标签滚动";
        OneViewController *oneVC = [[OneViewController alloc] init];
        TwoViewController *twoVC = [[TwoViewController alloc] init];
        ThreeViewController *threeVC = [[ThreeViewController alloc] init];
        FourViewController *four=[[FourViewController alloc]init];
        FiveViewController *five = [[FiveViewController alloc]init];
        
        slideMenu.controllers = @[oneVC,twoVC,threeVC,four,five];
        slideMenu.titles = @[@"全部订单",@"待发货",@"待收货",@"待评价",@"售后"];
        slideMenu.bottomLineWidth = 50;
        slideMenu.bottomLineHeight = 1;
        //    slideMenu.titleFont = [UIFont systemFontOfSize:12];
        //    slideMenu.titleSelectFont = [UIFont systemFontOfSize:16];
        //    slideMenu.titleColor = [UIColor lightGrayColor];
        //    slideMenu.titleSelectColor = [UIColor blueColor];
        [self.navigationController pushViewController:slideMenu animated:YES];
        
    }else if(indexPath.row == 2){
        SjjHeaderViewController *vc = [[SjjHeaderViewController alloc]init];
        vc.title=@"给UIView添加滚动";
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 3){
        
        SjjNavBarTitielScroller *vc = [[SjjNavBarTitielScroller alloc]init];
        vc.title=@"NavBarTitielScroller";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 4){
        SjjInfoViewLeft *vc = [[SjjInfoViewLeft alloc]init];
        vc.title = @"仿qq点击出现个人信息";
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 5){
        SjjMyorderList *listvc=[[SjjMyorderList alloc]init];
        listvc.title=@"我的订单";
        listvc.stuta=@"0";
        [self.navigationController pushViewController:listvc animated:YES];
    }else if(indexPath.row == 6){
        SjjMBPVC *VC = [[SjjMBPVC alloc]init];
        VC.title = @"MBP原生使用";
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 8){
//        个人设置中心
        SjjMYinfoVC *vc=[[SjjMYinfoVC alloc]init];
        vc.title=@"设置";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 9){
        SjjlayerVC *vc =[[SjjlayerVC alloc]init];
        vc.title = @"蒙版视图";
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 10){
//        系统相机相册
        SjjCamersAddphotol * vc = [[SjjCamersAddphotol alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 11){
        SjjTimer *vc = [[SjjTimer alloc]init];
        vc.title =@"定时器";
        [self.navigationController pushViewController: vc animated:YES];
    }  else{
        SjjcollectionVC *vc =[[SjjcollectionVC alloc]init];
        vc.title = @"collection";
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}


//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 40;
    }
    return 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
