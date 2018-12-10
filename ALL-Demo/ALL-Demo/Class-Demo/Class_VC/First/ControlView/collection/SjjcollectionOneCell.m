//
//  SjjcollectionOneCell.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjcollectionOneCell.h"
@interface SjjcollectionOneCell()
@end

@implementation SjjcollectionOneCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        
        
        self.imgview=[[UIImageView alloc]init];
        self.imgview.contentMode=UIViewContentModeScaleToFill;
        [self.contentView addSubview:self.imgview];
        [self.imgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
        }];
        
        self.select=[[UIButton alloc]init];
        self.select.clipsToBounds=YES;
        self.select.layer.borderColor=[UIColor blackColor].CGColor;
        self.select.layer.borderWidth=1;
        self.select.layer.cornerRadius=7.5;
        [self.contentView addSubview:self.select];
        [self.select mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.top.equalTo(self.contentView).offset(10);
            make.height.width.mas_equalTo(15);
        }];
    }
    return self;
}

- (void)setModel:(SjjimgModel *)model{
    _model=model;
    if (_model.isselectbtn.intValue == 0) {
        self.select.hidden = YES;
        
    }else{
//        1
         self.select.hidden = NO;
        self.select.backgroundColor=[UIColor whiteColor];
    }
    if (model.smalimh) {
//        [self.imgview sd_setImageWithURL:[NSURL URLWithString:model.smalimh]];
    }else{
//         [self.imgview sd_setImageWithURL:[NSURL URLWithString:model.ids]];
    }
    
        
}
@end
