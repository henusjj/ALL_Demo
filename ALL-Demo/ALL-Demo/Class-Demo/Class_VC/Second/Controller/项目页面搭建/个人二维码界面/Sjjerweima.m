//
//  Sjjerweima.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/7.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "Sjjerweima.h"

@interface Sjjerweima ()
@property(nonatomic,strong)UIScrollView *scorll;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *bigimg;
@property(nonatomic,strong)UIImageView *smallimg;
@property(nonatomic,strong)UIImageView *centerimg;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *address;

@end

@implementation Sjjerweima

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scorll];
    [self.scorll addSubview:self.bgView];
    [self.bgView addSubview:self.smallimg];
    [self.bgView addSubview:self.name];
    [self.bgView addSubview:self.address];
    [self.bgView addSubview:self.bigimg];
    [self.bigimg addSubview:self.centerimg];
    
    [self.scorll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scorll);
        make.centerY.equalTo(self.scorll);
        make.width.mas_equalTo(ScreenWidth-40);
        make.height.mas_equalTo(300);
        
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
    [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name.mas_bottom).offset(4);
        make.left.equalTo(self.name);
        make.height.mas_equalTo(13);
    }];
    
    self.bigimg.backgroundColor=[UIColor redColor];
    [self.bigimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.smallimg.mas_bottom).offset(15);
        make.right.equalTo(self.bgView).offset(-20);
        make.width.height.mas_equalTo(150);
        make.bottom.equalTo(self.bgView).offset(-20);
    }];
    
    self.centerimg.backgroundColor=[UIColor blueColor];
    [self.centerimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bigimg);
        make.centerY.equalTo(self.bigimg);
        make.height.width.mas_equalTo(50);
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
-(UIImageView *)centerimg{
    if (_centerimg==nil) {
        _centerimg = [[UIImageView alloc]init];
        _centerimg.clipsToBounds=YES;
        _centerimg.layer.cornerRadius=5;
    }
    return _centerimg;
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

- (UILabel *)address{
    if (_address == nil) {
        _address = [[UILabel alloc]init];
        _address.textColor=[UIColor blackColor];
        _address.text=@"yiyi";
        _address.font=[UIFont systemFontOfSize:12];
    }
    return _address;
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
