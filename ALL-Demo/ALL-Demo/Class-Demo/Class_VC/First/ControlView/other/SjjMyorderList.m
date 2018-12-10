//
//  SjjMyorderList.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/27.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjMyorderList.h"
//工具类
#import "YasinCustomTabBar.h"

#import "Sjj-MyOrder-tableViewCell.h"

@interface SjjMyorderList ()<UITableViewDelegate,UITableViewDataSource,OrderListStateDelegate>

@end

@implementation SjjMyorderList

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatMenu];
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 47, ScreenWidth, ScreenHeight-47-49);
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
}

-(void)creatMenu{
    NSArray *menuList=@[@"全部订单",@"待付款",@"待使用",@"待评价",@"售后"];
    YasinCustomTabBar *menu=[[YasinCustomTabBar alloc]init];
    [menu setTabBarPoint:CGPointMake(0, 0)];
    menu.lineWide=30;
    [menu setData:menuList NormalColor:[UIColor grayColor] SelectColor:[UIColor redColor] Font:[UIFont systemFontOfSize:15*SCALE]];
    
    menu.lineColor=[UIColor orangeColor];
    [self.view addSubview:menu];
//    点进去选择状态
    [menu setViewIndex:self.stuta.intValue];//这里始终是选择全部订单
    
//    标签回调
    [menu getViewIndex:^(NSString *title, NSInteger index) {
        self.stuta = [NSString stringWithFormat:@"%ld",index];
        NSLog(@"index--------%@",self.stuta);
        
//        点击标签需要做的事情（请求数据）
        
        [self.tableView reloadData];
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Sjj_MyOrder_tableViewCell *cell = [Sjj_MyOrder_tableViewCell cellWithtableVie:tableView];
    //    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.textLabel.text=@"1";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma  mark delegate

-(void)selectBtn:(NSInteger)tag{
    if (tag == 1) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
