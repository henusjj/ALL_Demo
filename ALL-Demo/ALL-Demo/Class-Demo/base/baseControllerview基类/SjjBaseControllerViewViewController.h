//
//  SjjBaseControllerViewViewController.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/5/7.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SjjBaseControllerViewViewController : UIViewController


/**
 *  修改状态栏颜色
 */
@property (nonatomic, assign) UIStatusBarStyle StatusBarStyle;

//返回按钮
@property (strong, nonatomic) UIButton *backBtn;

- (void)backAction;

 
/**
 通用table，collect
 */
@property (nonatomic,strong)UITableView *tableView ;
@property (nonatomic, strong) UICollectionView * collectionView;


/**
 *  显示没有数据页面
 */
-(void)showNoDataImage;

/**
 *  移除无数据页面
 */
-(void)removeNoDataImage;


/**
 *  加载视图
 */
- (void)showLoadingAnimation;

/**
 *  停止加载
 */
- (void)stopLoadingAnimation;


/**
 是否隐藏导航栏
 */
@property (nonatomic, assign) BOOL isHidenNaviBar;

@end
