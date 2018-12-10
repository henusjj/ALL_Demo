//
//  SjjphoneCell.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/7.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjphoneCell.h"

@interface SjjphoneCell()
@property(nonatomic,strong)UIImageView *img;

@end

@implementation SjjphoneCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor=[UIColor whiteColor];
        
        self.img=[[UIImageView alloc]init];
        self.img.backgroundColor=[UIColor grayColor];
        [self.contentView addSubview:self.img];
        [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(3);
            make.bottom.equalTo(self.contentView).offset(-3);
            make.height.width.mas_equalTo(40);
        }];
        
        self.name=[[UILabel alloc]init];
        self.name.text = @"nihao";
        self.name.font=[UIFont systemFontOfSize:13];
        self.name.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.name];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.img);
            make.left.equalTo(self.img.mas_right).offset(5);
            make.height.mas_equalTo(13);
        }];
        
        self.add = [[UIButton alloc]init];
        self.add.backgroundColor=[UIColor blueColor];
        [self.add setTitle:@"添加" forState:UIControlStateNormal];
        [self.add setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.add.titleLabel.font=[UIFont systemFontOfSize:13];
        [self.add addTarget:self action:@selector(touchclick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.add];
        [self.add mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.width.mas_equalTo(50);
        }];
    }
    return self;
}

-(void)touchclick{
    self.clickadd();
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
