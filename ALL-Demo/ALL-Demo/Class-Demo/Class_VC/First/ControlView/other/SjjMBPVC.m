//
//  SjjMBPVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/28.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjMBPVC.h"

@interface SjjMBPVC ()
@property(nonatomic,strong)MBProgressHUD *HUD;

@end

@implementation SjjMBPVC

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i=0; i<4; i++) {
    UIButton *btn=[[UIButton alloc]init];
    btn.titleLabel.font=[UIFont systemFontOfSize:12];
        btn.layer.borderColor=[UIColor grayColor].CGColor;
        btn.layer.borderWidth=1;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"点一下试试" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(MBP:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i+1;
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50*(i+1));
        make.left.equalTo(self.view).offset(20);
        make.height.mas_equalTo(@25);
        make.width.mas_equalTo(@100);
    }];
        
    }
    
    
    
    for (int i=0; i<4; i++) {
        UIButton *btn=[[UIButton alloc]init];
        btn.titleLabel.font=[UIFont systemFontOfSize:12];
        btn.layer.borderColor=[UIColor grayColor].CGColor;
        btn.layer.borderWidth=1;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:@"封装的使用" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(MBPtwo:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=i+1;
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(50*(i+1));
            make.left.equalTo(self.view).offset(140);
            make.height.mas_equalTo(@25);
            make.width.mas_equalTo(@100);
        }];
        
    }
}

-(void)MBP:(UIButton *)sender{
//    NSLog(@"%ld",sender.tag);
//    // 只显示文字
//    if (sender.tag ==1) {
//        self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
//        [self.view addSubview:_HUD];
//        _HUD.labelText = @"加载中,请稍等...";
//        _HUD.mode = MBProgressHUDModeText;
//
//        [_HUD showAnimated:YES whileExecutingBlock:^{
//            sleep(2);
//
//        }
//           completionBlock:^{
//               [_HUD removeFromSuperview];
//               _HUD = nil;
//           }];
//    }
//
//    if (sender.tag ==2) {
//        //动画
//        //自定义view
//        self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
//        //取消背景框
//        self.HUD.color = [UIColor whiteColor];
//
//        [self.view addSubview:_HUD];
//
//        UIImageView *images = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
////        images.backgroundColor=[UIColor grayColor];
//        NSMutableArray *imageArray = [[NSMutableArray alloc]init];
//
//        for(int i = 1; i < 26 ; i++){
//            NSString *imgName = [NSString stringWithFormat:@"dropdown_loading_0%d",i];
//
//            [imageArray addObject:[UIImage imageNamed:imgName]];
//        }
//
//        images.animationDuration = 0.7;
//
//        images.animationImages = imageArray;
//        // 开始播放
//        [images startAnimating];
//
//
//        //自定义
//        _HUD.mode = MBProgressHUDModeCustomView;
//        _HUD.delegate = self;
//
//        _HUD.customView = images;
//
//        [_HUD show:YES];
//        //延迟
//        [_HUD hide:YES afterDelay:3];
//
//
//    }
//    if (sender.tag ==3) {
//        //圆形进度条
//        self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
//
//        [self.view addSubview:_HUD];
//
//        _HUD.mode = MBProgressHUDModeDeterminate;
//
//        _HUD.delegate = self;
//
//        _HUD.labelText = @"等待中";
//
//        [_HUD showWhileExecuting:@selector(ProgressBar) onTarget:self withObject:nil animated:YES];
//
//
//    }
//    if (sender.tag ==4) {
//        //初始化进度框，置于当前的View当中
//        self.HUD = [[MBProgressHUD alloc] initWithView:self.view];
//        [self.view addSubview:_HUD];
//
//        //如果设置此属性则当前的view置于后台
//        _HUD.dimBackground = YES;
//
//        //设置对话框文字
//        _HUD.labelText = @"加载中";
//        //细节文字
//        _HUD.detailsLabelText = @"请耐心等待";
//
//        //显示对话框
//        [_HUD showAnimated:YES whileExecutingBlock:^{
//            //对话框显示时需要执行的操作
//            sleep(3);
//        }// 在HUD被隐藏后的回调
//           completionBlock:^{
//               //操作执行完后取消对话框
//               [_HUD removeFromSuperview];
//               _HUD = nil;
//           }];
//
//
//    }
    
}

//  进度条  计算
- (void)ProgressBar{
    // 进度指示器，从0.0到1.0，默认值为0.0
    float progress = 0.0f;
    
    while (progress < 1.0f) {
        
        progress += 0.01f;
        
        _HUD.progress = progress;
        
        //        usleep函数能把进程挂起一段时间， 单位是微秒（千分之一毫秒）
        usleep(50000);
    }
}





-(void)MBPtwo:(UIButton *)sender{
    if (sender.tag == 1) {
        [MBProgressHUD showError:@"请求错误1" toView:self.view];
    }
    if (sender.tag == 2) {
        [MBProgressHUD showSuccess:@"成功2"];
    }
    if (sender.tag == 3) {
        [MBProgressHUD showMessage:@"请稍等..." toView:self.view];
//        self.view.window
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view];
        });
    }
    if (sender.tag == 4) {
        [MBProgressHUD hideHUD];
//        [MBProgressHUD ]
    }
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
