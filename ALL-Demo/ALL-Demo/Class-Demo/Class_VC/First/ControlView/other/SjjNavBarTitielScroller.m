//
//  SjjNavBarTitielScroller.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjNavBarTitielScroller.h"
#import "LLSegmentBarVC.h"
#import "ChildVCOne.h"
#import "ChildVCTwo.h"
#import "ChildVCThree.h"

@interface SjjNavBarTitielScroller ()
@property (nonatomic,weak) LLSegmentBarVC * segmentVC;//

@end

@implementation SjjNavBarTitielScroller


#pragma mark - segmentVC
- (LLSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LLSegmentBarVC *vc = [[LLSegmentBarVC alloc]init];
        // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //   录像按钮
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraAction)];
    self.navigationItem.rightBarButtonItem = cameraButton;
    
    // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(50, 0, ScreenWidth-100, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"关注", @"发现", @"同城"];
    ChildVCOne *follow = [[ChildVCOne alloc] init];
    ChildVCTwo *find = [[ChildVCTwo alloc] init];
    ChildVCThree *city = [[ChildVCThree alloc] init];
    // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[follow,find,city]];
    // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor lightGrayColor]).itemSelectColor([UIColor orangeColor]).indicatorColor([UIColor orangeColor]);
    }];
}
#pragma mark - 弹出抽屉
-(void)moreCourseAction {
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
#pragma mark - 进入录像
- (void)cameraAction {
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置打开抽屉模式
//    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
