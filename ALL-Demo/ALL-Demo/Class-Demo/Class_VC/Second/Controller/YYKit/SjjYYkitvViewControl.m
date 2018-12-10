//
//  SjjYYkitvViewControl.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/18.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjYYkitvViewControl.h"
#import "SjjYYText.h"
#import "SjjYYModelVC.h"
#import "SjjCacheVC.h"
@interface SjjYYkitvViewControl ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SjjYYkitvViewControl{
    NSArray *arryNum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    /**
     YYModel — 高性能的 iOS JSON 模型框架。
     YYCache — 高性能的 iOS 缓存框架。
     YYImage — 功能强大的 iOS 图像框架。
     YYWebImage — 高性能的 iOS 异步图像加载框架。
     YYText — 功能强大的 iOS 富文本框架。
     YYKeyboardManager — iOS 键盘监听管理工具。
     YYDispatchQueuePool — iOS 全局并发队列管理工具。
     YYAsyncLayer — iOS 异步绘制与显示的工具。
     YYCategories — 功能丰富的 Category 类型工具库。

     */
    arryNum = @[@"YYModel — 高性能的 iOS JSON 模型框架",@"YYCache — 高性能的 iOS 缓存框架",@"YYText — 功能强大的 iOS 富文本框架",@"YYKeyboardManager — iOS 键盘监听管理工具",@"YYCategories — 功能丰富的 Category 类型工具库"];
}



#pragma mark table--delegate---dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arryNum.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = arryNum[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 2:
        {
            SjjYYText *vc = [[SjjYYText alloc]init];
            vc.title = @"YYText";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 0:{
            SjjYYModelVC *vc = [[SjjYYModelVC alloc]init];
            vc.title = @"请查看代码";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            case 1:
        {
            SjjCacheVC *vc =[[SjjCacheVC alloc]init];
            vc.title=@"缓存";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
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
