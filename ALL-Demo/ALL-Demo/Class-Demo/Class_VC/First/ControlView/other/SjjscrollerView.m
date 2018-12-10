//
//  SjjscrollerView.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/20.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjscrollerView.h"
#import "Sjj-cycleScroller.h"
@interface SjjscrollerView ()<CycleScrollViewDelegate>{
    
}

@end

@implementation SjjscrollerView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于ScrollerView";
    Sjj_cycleScroller *scroller = [[Sjj_cycleScroller alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200) imageGroups:@[@"h1",@"h2",@"h3",@"h4"]];
    scroller.delegate = self;
    [self.view addSubview:scroller];
    
}

//代理

-(void)cycleScroller:(Sjj_cycleScroller *)cycleScrollerView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击index==%ld",index);
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
