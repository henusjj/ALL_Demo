//
//  SjjYYModel.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/18.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjYYModelVC.h"

#import "SjjyyModel.h"


@interface SjjYYModelVC ()

@end

@implementation SjjYYModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [session POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    id  _Nullable responseObject;
#pragma mark ============ 请求成功的时候 ============
    SjjyyModel *result = [SjjyyModel modelWithJSON:responseObject];
//
//        if (success && responseObject) {
//            success(result);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error) {
//            failure(error);
//        }
//    }];
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
