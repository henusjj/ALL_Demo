//
//  SjjTimer.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/5.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjTimer.h"

@interface SjjTimer ()
@property(nonatomic,strong)UILabel *timer;
@end

@implementation SjjTimer{
    dispatch_source_t _timers;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_timers) {
        dispatch_source_cancel(_timers);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *timer=[[UILabel alloc]init];//WithFrame:CGRectMake(0, 100, 200, 50)];
    timer.font=[UIFont systemFontOfSize:13];
    timer.layer.borderColor=[UIColor grayColor].CGColor;
    timer.layer.borderWidth = 0.5;
    timer.textColor=[UIColor blueColor];
    timer.numberOfLines=0;
    timer.text=@"";
    [self.view addSubview:timer];
    self.timer=timer;
    [self.timer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).mas_offset(10);
        make.right.equalTo(self.view).offset(-10);
        
    }];
    
    UIButton *btn=[[UIButton alloc]init];
    btn.layer.borderColor=[UIColor redColor].CGColor;
    btn.layer.borderWidth=0.5;
    [btn setTitle:@"开始倒计时" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:13];
    [btn addTarget:self action:@selector(daojishi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);

        make.top.equalTo(timer.mas_bottom).offset(50);
        make.height.mas_offset(50);
    }];
    
    
}
-(void)daojishi{
        __block int timeout =1800;//倒计时30分钟
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        _timers = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        
        dispatch_source_set_timer(_timers, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);//每秒执行
        
        
        dispatch_source_set_event_handler(_timers, ^{
            
            if (timeout<=0) {
                
                dispatch_source_cancel(_timers);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    //NSLog(@"计时结束");
                    //                [VGNotiCenter postNotificationName:@"orderShixiao" object:nil];
                    [self.navigationController popViewControllerAnimated:YES];
                });
                
            }else {
                
                int minutes = timeout/60;
                
                int seconds = timeout%60;
                //  NSString *strTime = [NSString stringWithFormat:@"%d 分钟 %d 秒", minutes, seconds];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    self.timer.text = [NSString stringWithFormat:@"剩%d分%d秒自动关闭",minutes,seconds];
                    
                    //  label.text = [NSString stringWithFormat:@"支付剩余时间  %@",strTime];
                });
                
                timeout--;
                //            NSLog(@"111111=-----%d",timeout);
            }
            
        });
        
        dispatch_resume(_timers);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
