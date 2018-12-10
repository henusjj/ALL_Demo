//
//  SjjMJExtensionVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjMJExtensionVC.h"
#import "MJUser.h"
#import "MJAd.h"
#import "MJStatus.h"
#import "MJStudent.h"
#import "MJStatusResult.h"
#import "MJBag.h"
#import "MJDog.h"
#import "MJBook.h"
#import "MJBox.h"
@interface SjjMJExtensionVC ()

@end

@implementation SjjMJExtensionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 1.定义一个字典
    NSDictionary *dict = @{
                           @"text" : @"是啊，今天天气确实不错！",
                           
                           @"user" : @{
                                   @"name" : @"Jack",
                                   @"icon" : @"lufy.png"
                                   },
                           
                           @"retweetedStatus" : @{
                                   @"text" : @"今天天气真不错！",
                                   
                                   @"user" : @{
                                           @"name" : @"Rose",
                                           @"icon" : @"nami.png"
                                           }
                                   }
                           };
    
    // 2.将字典转为Status模型
    MJStatus *status = [MJStatus mj_objectWithKeyValues:dict];
    
    // 3.打印status的属性
    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    MJExtensionLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    
    // 4.打印status.retweetedStatus的属性
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    MJExtensionLog(@"text2=%@, name2=%@, icon2=%@", text2, name2, icon2);
    
    
    // 1.定义一个字典
    NSDictionary *dict2 = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"今天天气真不错！",
                                       
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   
                                   @{
                                       @"text" : @"明天去旅游了",
                                       
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   
                                   ],
                           
                           @"ads" : @[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.小码哥ad01.com"
                                       },
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.小码哥ad02.com"
                                       }
                                   ],
                           
                           @"totalNumber" : @"2014",
                           @"previousCursor" : @"13476589",
                           @"nextCursor" : @"13476599"
                           };
    
    // 2.将字典转为MJStatusResult模型
    MJStatusResult *result = [MJStatusResult mj_objectWithKeyValues:dict2];
    
    // 3.打印MJStatusResult模型的简单属性
    MJExtensionLog(@"totalNumber=%@, previousCursor=%lld, nextCursor=%lld", result.totalNumber, result.previousCursor, result.nextCursor);
    
    // 4.打印statuses数组中的模型属性
    for (MJStatus *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        MJExtensionLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    }
    
    // 5.打印ads数组中的模型属性
    for (MJAd *ad in result.ads) {
        MJExtensionLog(@"image=%@, url=%@", ad.image, ad.url);
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
