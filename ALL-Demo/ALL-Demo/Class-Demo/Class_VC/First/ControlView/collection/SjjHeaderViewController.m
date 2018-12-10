//
//  SjjHeaderViewController.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/22.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjHeaderViewController.h"

@interface SjjHeaderViewController ()
@property(nonatomic,strong)UIView *bigView;
@property(nonatomic,strong)UIScrollView *scroller;
@end

@implementation SjjHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scroller = [[UIScrollView alloc]init];
    self.scroller.backgroundColor=[UIColor whiteColor];
    self.scroller.showsVerticalScrollIndicator=YES;//竖直
    self.scroller.showsHorizontalScrollIndicator=NO;
    self.scroller.pagingEnabled=NO;
    [self.view addSubview:self.scroller];
    
    [self.scroller mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    self.bigView=[[UIView alloc]init];
    self.bigView.backgroundColor = [UIColor redColor];
    [self.scroller addSubview:self.bigView];
    [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo (self.scroller);
        make.width.equalTo(self.scroller);//xxx
        make.height.equalTo(@1111);

    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLayView)];
    [self.scroller addGestureRecognizer:tap];
}

- (void)tapLayView{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
