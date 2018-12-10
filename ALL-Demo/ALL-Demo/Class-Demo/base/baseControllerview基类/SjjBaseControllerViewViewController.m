//
//  SjjBaseControllerViewViewController.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/5/7.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjBaseControllerViewViewController.h"

@interface SjjBaseControllerViewViewController ()
@property (nonatomic,strong) UIImageView* noDataView;

@end

@implementation SjjBaseControllerViewViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //ViewController的背景颜色，如果整个App页面背景颜色比较统一，建议在这里设置
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     self.navigationController.navigationBar.translucent = YES航栏的属性默认 YES是透明效果并且主view不会偏移 NO是导航栏不透明 主view会向下偏移64px
     */
    self.navigationController.navigationBar.translucent = NO;
    //是否隐藏返回按钮
    self.navigationItem.hidesBackButton = NO;
    //返回按钮
    [self.backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if (@available(iOS 11.0, *)) {
        //scrollerView在导航栏透明时不下压
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return _StatusBarStyle;
}
//动态更新状态栏颜色
-(void)setStatusBarStyle:(UIStatusBarStyle)StatusBarStyle{
    _StatusBarStyle=StatusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)showLoadingAnimation
{
    
}

- (void)stopLoadingAnimation
{
    
}

-(void)showNoDataImage
{
    _noDataView=[[UIImageView alloc] init];
    [_noDataView setImage:[UIImage imageNamed:@"generl_nodata"]];
    WS(weakself);
    [self.view.subviews enumerateObjectsUsingBlock:^(UITableView* obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITableView class]]) {
            [weakself.noDataView setFrame:CGRectMake(0, 0,obj.frame.size.width, obj.frame.size.height)];
            [obj addSubview:weakself.noDataView];
        }
    }];
}

-(void)removeNoDataImage{
    if (_noDataView) {
        [_noDataView removeFromSuperview];
        _noDataView = nil;
    }
}

/**
 *  懒加载UITableView
 *
 *  @return UITableView
 */

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - kTopHeight -kTabBarHeight) style:UITableViewStylePlain];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.estimatedRowHeight = 100;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        
        //头部刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        _tableView.mj_header = header;
        
        //底部刷新
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
        //        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
        //        _tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
        
        _tableView.backgroundColor=[UIColor whiteColor];
        _tableView.scrollsToTop = YES;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

/**
 *  懒加载collectionView
 *
 *  @return collectionView
 */
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , ScreenHeight - kTopHeight - kTabBarHeight) collectionViewLayout:flow];
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        header.automaticallyChangeAlpha = YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        _collectionView.mj_header = header;
        
        //底部刷新
        _collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
        
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.scrollsToTop = YES;
    }
    return _collectionView;
}
-(void)headerRereshing{
//    NSLog(@"111");
    [self.tableView.mj_header endRefreshing];
}

-(void)footerRereshing{
//    NSLog(@"222");
    [self.tableView.mj_footer endRefreshing];
    
}

#pragma mark --返回按钮
- (UIButton *)backBtn {
    if (_backBtn == nil && self.navigationController.viewControllers.count > 1) {
        //        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        //        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [_backBtn setImage:[UIImage imageNamed:@"icon-return"]  forState:UIControlStateNormal];
        //        _backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        //        UIBarButtonItem *leftBackBarBtn = [[UIBarButtonItem alloc] initWithCustomView:_backBtn];
        //        UIBarButtonItem *fixedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        //        fixedButton.width = -15;
        //        if ([[[UIDevice currentDevice]systemVersion] floatValue] < 11) {
        //            self.navigationItem.leftBarButtonItems = @[fixedButton,leftBackBarBtn];
        //        }else {
        ////            self.navigationItem.leftBarButtonItems = @[leftBackBarBtn];
        //            self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(backAction) image:[UIImage imageNamed:@"icon-return"]];
        //
        //        }
        _backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _backBtn.frame = CGRectMake(0, 0, 44, 44);
        [_backBtn setImage:[UIImage imageNamed:@"icon-return"] forState:(UIControlStateNormal)];
        [_backBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backBtn];
    }
    return _backBtn;
}
#pragma mark - backAction返回
- (void)backAction {
    //    [self backBtnClick:nil];
    if (self.navigationController.presentedViewController || self.navigationController.presentingViewController) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
