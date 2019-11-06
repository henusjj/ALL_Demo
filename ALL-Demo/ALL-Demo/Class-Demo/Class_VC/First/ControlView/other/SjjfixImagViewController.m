//
//  SjjfixImagViewController.m
//  ALL-Demo
//
//  Created by GuoYanjun on 2019/4/24.
//  Copyright © 2019年 henusjj.com. All rights reserved.
//

#import "SjjfixImagViewController.h"


const CGFloat ICITopViewH = 350;

@interface SjjfixImagViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UIImageView *topView;

@end


@implementation SjjfixImagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.mj_header = nil;
    self.tableView.contentInset = UIEdgeInsetsMake(ICITopViewH*0.5, 0, 0, 0);
    UIImageView *topView = [UIImageView new];
    topView.image = [UIImage imageNamed:@"1"];
    topView.clipsToBounds = YES;
    topView.frame = CGRectMake(0, -ICITopViewH, ScreenWidth, ICITopViewH);
    //设置UUIImageView的内容显示模式。来实现下拉放大的关键
    topView.contentMode = UIViewContentModeScaleAspectFill;
    //插入到tableView的第一个子控件，使用addSubView的话，下拉会把底部的Cell遮挡。
    [self.tableView insertSubview:topView atIndex:0];
    self.topView = topView;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"cellwswswsw";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    cell.textLabel.text =@"11";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 向下拽了多少距离
    CGFloat down = -(ICITopViewH * 0.5) - scrollView.contentOffset.y;
    if (down < 0) return;
    
    CGRect frame = self.topView.frame;
    // 5决定图片变大的速度,值越大,速度越快
    frame.size.height = ICITopViewH + down * 1;
    self.topView.frame = frame;
}

@end
