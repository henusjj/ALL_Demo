//
//  SjjtianjiaAddress.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/2.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjtianjiaAddress.h"

@interface SjjtianjiaAddress ()

@end

@implementation SjjtianjiaAddress

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    回调block
    for (int i = 0; i<2; i++) {
        UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(100, 100*(i+1), 100, 30)];
        if (i == 0) {
            [btn setTitle:@"不带参数" forState:UIControlStateNormal];
        }else{
            [btn setTitle:@"带参数" forState:UIControlStateNormal];
        }
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i+1;
        [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}
-(void)btnclick:(UIButton *)sender{
    if (sender.tag == 1) {
        self.back();
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        self.state(sender.tag);
        [self.navigationController popViewControllerAnimated:YES];
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
