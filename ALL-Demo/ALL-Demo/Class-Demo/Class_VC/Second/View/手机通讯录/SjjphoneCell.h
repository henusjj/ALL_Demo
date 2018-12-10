//
//  SjjphoneCell.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/7.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^clickadd)(void);


@interface SjjphoneCell : UITableViewCell

@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UIButton * add;

@property(nonatomic,copy)clickadd clickadd;

@end
