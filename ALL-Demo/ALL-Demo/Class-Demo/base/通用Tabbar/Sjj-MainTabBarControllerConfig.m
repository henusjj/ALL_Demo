//
//  Sjj-MainTabBarControllerConfig.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/5/30.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "Sjj-MainTabBarControllerConfig.h"
#import "SjjBaseControllerViewViewController.h"
#import "SjjNavigationController.h"

#import "Five_Vc.h"
#import "Four_VC.h"
#import "Thrid_VC.h"
#import "Second_VC.h"
#import "First_VC.h"


@implementation Sjj_MainTabBarControllerConfig

-(CYLTabBarController *)mainTabbarVC{
    if (!_mainTabbarVC) {
        UIEdgeInsets imageInsets =UIEdgeInsetsZero;
        UIOffset titlePositionAdjustment = UIOffsetZero;
        _mainTabbarVC = [CYLTabBarController tabBarControllerWithViewControllers:[self arrayViewControllerItem] tabBarItemsAttributes:[self arrayAttributesItem] imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment];
        
        [self customizeTabBarAppearance:_mainTabbarVC];
    }
    return _mainTabbarVC;
}

- (NSArray *)arrayViewControllerItem{
    First_VC *First =[[First_VC alloc] init];
    First.title=@"我的";
    SjjNavigationController *firstnav=[[SjjNavigationController alloc] initWithRootViewController:First];
    
    Second_VC *Second = [[Second_VC alloc]init];
    Second.title=@"分类";
    SjjNavigationController *secondenav=[[SjjNavigationController alloc]initWithRootViewController:Second];
    
    Thrid_VC *Thrid = [[Thrid_VC alloc]init];
    Thrid.title=@"购物车";
    SjjNavigationController *thridnav=[[SjjNavigationController alloc]initWithRootViewController:Thrid];
    
    Four_VC *Four =[[Four_VC alloc]init];
    Four.title=@"社交";
    SjjNavigationController *Fournav=[[SjjNavigationController alloc]initWithRootViewController:Four];
    Five_Vc *Five=[[Five_Vc alloc]init];
    Five.title=@"视频";
    SjjNavigationController *Fivenav=[[SjjNavigationController alloc]initWithRootViewController:Five];
    ///返回需要加载的模块
    return @[firstnav,secondenav,thridnav,Fournav,Fivenav];
}

- (NSArray *)arrayAttributesItem{
    NSDictionary *one =@{
                                             CYLTabBarItemTitle : @"我的",
                                             CYLTabBarItemImage : @"bar_tk_01",
                                             /* NSString and UIImage are supported*/
                                             CYLTabBarItemSelectedImage : @"bar_tk_02",};
    
    NSDictionary *two = @{                    CYLTabBarItemTitle : @"分类",
                                              CYLTabBarItemImage : @"bar_kc_01",
                                              CYLTabBarItemSelectedImage : @"bar_kc_02",};
    
    NSDictionary *three = @{
                                           CYLTabBarItemTitle : @"购物车",
                                           CYLTabBarItemImage : @"bar_dzs_01",
                                           CYLTabBarItemSelectedImage : @"bar_dzs_02",};
    
    NSDictionary *four = @{
                                          CYLTabBarItemTitle : @"朋友圈",
                                          CYLTabBarItemImage : @"bar_wd_01",
                                          CYLTabBarItemSelectedImage : @"bar_wd_02"};
    
    NSDictionary *five = @{
                                          CYLTabBarItemTitle : @"视频",
                                          CYLTabBarItemImage : @"bar_wd_01",
                                          CYLTabBarItemSelectedImage : @"bar_wd_02"};
    
    NSArray *tabBarItemsAttributes = @[one,
                                       two,
                                       three,
                                       four,
                                       five];
    return tabBarItemsAttributes;
}


/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //     tabBarController.tabBarHeight = CYLTabBarControllerHeight;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    //     UITabBar *tabBarAppearance = [UITabBar appearance];
    //     [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tab_bar"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}


@end
