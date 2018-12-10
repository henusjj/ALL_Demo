//
//  Thrid_VC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/5/30.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "Thrid_VC.h"
#import "SjjViewController.h"

@interface Thrid_VC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation Thrid_VC{
    NSArray *arry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    arry = @[@"GCD",@"面试题代码练习"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arry.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid= @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = arry[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
            case 0:
            
            break;
            case 1:{
                SjjViewController *vc =[[SjjViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
            
        default:
            break;
    }
}

@end
