//
//  SjjqunErweima.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/7.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjqunErweima.h"

@interface SjjqunErweima ()
@property(nonatomic,strong)UIScrollView *scorll;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *bigimg;
@property(nonatomic,strong)UIImageView *smallimg;
@property(nonatomic,strong)UILabel *name;
@end

@implementation SjjqunErweima

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scorll];
    [self.scorll addSubview:self.bgView];
    [self.bgView addSubview:self.smallimg];
    [self.bgView addSubview:self.name];
    [self.bgView addSubview:self.bigimg];
    
    [self.scorll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scorll);
        make.centerY.equalTo(self.scorll);
        make.width.mas_equalTo(ScreenWidth-40);
        make.height.mas_equalTo(500);
        
    }];
    
    self.smallimg.backgroundColor=[UIColor redColor];
    [self.smallimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(10);
        make.top.equalTo(self.bgView).offset(15);
        make.height.width.mas_equalTo(@50);
    }];
    
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.smallimg.mas_right).offset(5);
        make.top.equalTo(self.smallimg);
        make.height.mas_equalTo(15);
    }];

    
    self.bigimg.backgroundColor=[UIColor redColor];
    [self.bigimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.smallimg.mas_bottom).offset(15);
        make.right.equalTo(self.bgView).offset(-20);
        make.width.height.mas_equalTo(150);
        make.bottom.equalTo(self.bgView).offset(-20);
    }];
    

}

-(UIScrollView *)scorll{
    if (_scorll==nil) {
        _scorll = [[UIScrollView alloc]init];
        _scorll.backgroundColor=[UIColor grayColor];
        _scorll.showsVerticalScrollIndicator=NO;
        _scorll.showsHorizontalScrollIndicator=NO;
        _scorll.pagingEnabled=NO;
        
    }
    return _scorll;
}

-(UIView *)bgView{
    if (_bgView==nil) {
        _bgView=[[UIView alloc]init];
        _bgView.backgroundColor=[UIColor whiteColor];
        _bgView.clipsToBounds=YES;
        _bgView.layer.borderWidth=0.5;
        _bgView.layer.borderColor=[UIColor yellowColor].CGColor;
        _bgView.layer.cornerRadius=5;
    }
    return _bgView;
}
-(UIImageView *)bigimg{
    if (_bigimg==nil) {
        _bigimg = [[UIImageView alloc]init];
        _bigimg.clipsToBounds=YES;
        _bigimg.layer.cornerRadius=5;
    }
    return _bigimg;
}

-(UIImageView *)smallimg{
    if (_smallimg == nil) {
        _smallimg =[[UIImageView alloc]init];
        _smallimg.clipsToBounds=YES;
        _smallimg.layer.cornerRadius=5;
        
    }
    return _smallimg;
}

-(UILabel *)name{
    if (_name==nil) {
        _name =[[UILabel alloc]init];
        _name.text = @"nihao";
        _name.font=[UIFont systemFontOfSize:15];
        _name.textColor= [UIColor blackColor];
        
    }
    return _name;
}

@end
