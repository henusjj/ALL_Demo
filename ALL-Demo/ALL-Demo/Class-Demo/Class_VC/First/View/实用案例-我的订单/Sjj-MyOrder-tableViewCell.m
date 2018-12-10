//
//  Sjj-MyOrder-tableViewCell.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/28.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "Sjj-MyOrder-tableViewCell.h"

@interface Sjj_MyOrder_tableViewCell()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *orderId;//订单编号
@property(nonatomic,strong)UILabel *orderstate;//订单状态
@property(nonatomic,strong)UIImageView *prodImg;//商品照片
@property(nonatomic,strong)UILabel *prodName;
@property(nonatomic,strong)UILabel *prodNum;
@property(nonatomic,strong)UILabel *prodPrice;
@property(nonatomic,strong)UILabel *prodpayPrice;//实付金额
@property(nonatomic,strong)UIButton *leftbtn;
@property(nonatomic,strong)UIButton *centerbtn;
@property(nonatomic,strong)UIButton *rightbtn;

@end


@implementation Sjj_MyOrder_tableViewCell

+(instancetype)cellWithtableVie:(UITableView *)tableView{
    static NSString *cellId = @"cellid";
    Sjj_MyOrder_tableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[Sjj_MyOrder_tableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        创建UI
        self.contentView.backgroundColor=R_G_B_16(0xFAFAFA);
        self.bgView=[[UIView alloc]init];
        self.bgView.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-10);
            //      make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 0, 0));各个边界距离
            
        }];
        
        UIView *header=[[UIView alloc]init];
        [self.bgView addSubview:header];
        [header mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.bgView);
            make.height.mas_equalTo(37);
        }];
        
        self.orderId=[[UILabel alloc]init];
        self.orderId.textAlignment=NSTextAlignmentLeft;
        self.orderId.text=@"订单编号：123456789";
        self.orderId.font=[UIFont systemFontOfSize:13];

        [header addSubview:self.orderId];
        [self.orderId mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(header);
            make.left.equalTo(header).offset(10);
        }];
        
        self.orderstate=[[UILabel alloc]init];
        self.orderstate.textAlignment=NSTextAlignmentRight;
        self.orderstate.text=@"交易成功";
        self.orderstate.font=[UIFont systemFontOfSize:12];

        [header addSubview:self.orderstate];
        [self.orderstate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(header);
            make.right.equalTo(header).offset(-10);
            
        }];
        
        UIView *headerline=[[UIView alloc]init];
        headerline.backgroundColor=[UIColor grayColor];
        [self.bgView addSubview:headerline];
        [headerline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgView);
            make.top.equalTo(header.mas_bottom).offset(0);
            make.height.mas_equalTo(1);
        }];
        
        self.prodImg=[[UIImageView alloc]init];
        self.prodImg.backgroundColor=[UIColor redColor];
        [self.bgView addSubview:self.prodImg];
        [self.prodImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headerline.mas_bottom).offset(19);
            make.left.equalTo(self.bgView).offset(10);
            make.height.width.mas_equalTo(72);
        }];
        
        self.prodName=[[UILabel alloc]init];
        self.prodName.textAlignment=NSTextAlignmentLeft;
        self.prodName.text=@"我的名字";
        self.prodName.font=[UIFont systemFontOfSize:12];
        [self.bgView addSubview:self.prodName];
        [self.prodName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.prodImg.mas_right).offset(10);
            make.top.equalTo(self.prodImg);
            make.height.mas_equalTo(13);
            
        }];
        
        self.prodNum=[[UILabel alloc]init];
        self.prodNum.textAlignment=NSTextAlignmentLeft;
        self.prodNum.text=@"数量：1";
        self.prodNum.font=[UIFont systemFontOfSize:12];
        [self.bgView addSubview:self.prodNum];
        [self.prodNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.prodImg.mas_right).offset(10);
            make.top.equalTo(self.prodName.mas_bottom).offset(14);
            make.height.mas_equalTo(13);
            
        }];
        
        self.prodPrice=[[UILabel alloc]init];
        self.prodPrice.textAlignment=NSTextAlignmentLeft;
        self.prodPrice.text=@"总价：¥123";
        self.prodPrice.font=[UIFont systemFontOfSize:12];
        [self.bgView addSubview:self.prodPrice];
        [self.prodPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.prodImg.mas_right).offset(10);
            make.top.equalTo(self.prodNum.mas_bottom).offset(13);
            make.height.mas_equalTo(13);
            
        }];
        
        UIView *centerline=[[UIView alloc]init];
        centerline.backgroundColor=[UIColor grayColor];
        [self.bgView addSubview:centerline];
        [centerline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgView);
            make.top.equalTo(self.prodImg.mas_bottom).offset(17);
            make.height.mas_equalTo(1);
        }];
        
        self.prodpayPrice=[[UILabel alloc]init];
        self.prodpayPrice.textAlignment=NSTextAlignmentLeft;
        self.prodpayPrice.text=@"应付金额：¥123";
        self.prodpayPrice.font=[UIFont systemFontOfSize:11];
        [self.bgView addSubview:self.prodpayPrice];
        [self.prodpayPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView).offset(10);
            make.height.mas_equalTo(42);
            make.top.equalTo(centerline.mas_bottom).offset(0);
            make.bottom.equalTo(self.bgView);
            
        }];
        
        self.leftbtn=[[UIButton alloc]init];
        self.leftbtn.layer.masksToBounds=YES;
        self.leftbtn.layer.cornerRadius=5;
        self.leftbtn.layer.borderColor=[UIColor redColor].CGColor;
        self.leftbtn.layer.borderWidth=1;
        self.leftbtn.titleLabel.font=[UIFont systemFontOfSize:12];
        [self.leftbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.leftbtn setTitle:@"评价" forState:UIControlStateNormal];
        self.leftbtn.tag=1;
        [self.leftbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:self.leftbtn];
        [self.leftbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.bgView).offset(-10);
            make.top.equalTo(centerline).offset(10);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(71);
            
        }];
        
        self.centerbtn=[[UIButton alloc]init];
        self.centerbtn.layer.masksToBounds=YES;
        self.centerbtn.layer.cornerRadius=5;
        self.centerbtn.layer.borderColor=[UIColor grayColor].CGColor;
        self.centerbtn.layer.borderWidth=1;
        self.centerbtn.titleLabel.font=[UIFont systemFontOfSize:12];
        [self.centerbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.centerbtn setTitle:@"删除订单" forState:UIControlStateNormal];
        self.centerbtn.tag=2;
        [self.centerbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:self.centerbtn];
        [self.centerbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.leftbtn.mas_left).offset(-10);
            make.top.equalTo(centerline).offset(10);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(71);
            
        }];
        
        self.rightbtn=[[UIButton alloc]init];
        self.rightbtn.layer.masksToBounds=YES;
        self.rightbtn.layer.cornerRadius=5;
        self.rightbtn.layer.borderColor=[UIColor grayColor].CGColor;
        self.rightbtn.layer.borderWidth=1;
        self.rightbtn.titleLabel.font=[UIFont systemFontOfSize:12];
        [self.rightbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.rightbtn setTitle:@"联系团队" forState:UIControlStateNormal];
        self.rightbtn.tag=3;
        [self.rightbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:self.rightbtn];
        [self.rightbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.centerbtn.mas_left).offset(-10);
            make.top.equalTo(centerline).offset(10);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(71);
            
        }];
        
        
        
    }
    return self;
    
}

-(void)btnClick:(UIButton *)button{
    if (self.btndelegate && [self.btndelegate respondsToSelector:@selector(selectBtn:)]) {
        [self.btndelegate selectBtn:button.tag];
    }
    
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
