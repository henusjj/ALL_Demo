//
//  SjjViewController.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/10/15.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjViewController.h"

#import "SjjViewController1.h"

@interface SjjViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SjjViewController{
    NSArray *arry;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    arry = @[@"vc的生命周期",@"1"];
    
    NSLog(@"Current method:%@",NSStringFromSelector(_cmd));
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"Current method:%@",NSStringFromSelector(_cmd));
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Current method:%@",NSStringFromSelector(_cmd));
}

//-(void)viewWillLayoutSubviews{
//    NSLog(@"Current method:%@",NSStringFromSelector(_cmd));
//}
//
//-(void)viewDidLayoutSubviews{
//    NSLog(@"Current method:%@",NSStringFromSelector(_cmd));
//}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"Current method:%@",NSStringFromSelector(_cmd));

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"Current method:%@",NSStringFromSelector(_cmd));

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
            case 0:{
                SjjViewController1 *vc =[[SjjViewController1 alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        default:
            break;
    }
}

@end
