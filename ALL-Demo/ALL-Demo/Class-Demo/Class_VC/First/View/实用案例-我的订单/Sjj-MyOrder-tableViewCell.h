//
//  Sjj-MyOrder-tableViewCell.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/28.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Sjj_MyOrder_tableViewCell;

@protocol OrderListStateDelegate <NSObject>
//cell上的button按钮相应时间
-(void)selectBtn:(NSInteger)tag;
@end


@interface Sjj_MyOrder_tableViewCell : UITableViewCell

@property(nonatomic,weak)id<OrderListStateDelegate> btndelegate;

+(instancetype)cellWithtableVie:(UITableView *)tableView;

@end
