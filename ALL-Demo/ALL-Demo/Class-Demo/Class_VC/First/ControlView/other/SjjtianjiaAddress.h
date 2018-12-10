//
//  SjjtianjiaAddress.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/2.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjBaseControllerViewViewController.h"

typedef void (^backLoaddata)(void);//没有参数

typedef void (^backfrom)(NSInteger state);

@interface SjjtianjiaAddress : SjjBaseControllerViewViewController

@property(nonatomic,copy)backLoaddata back;
@property(nonatomic,copy)backfrom state;
@end
