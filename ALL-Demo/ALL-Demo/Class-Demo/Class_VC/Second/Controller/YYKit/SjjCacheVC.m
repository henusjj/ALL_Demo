//
//  SjjCacheVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/19.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjCacheVC.h"

@interface SjjCacheVC ()

@end

@implementation SjjCacheVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark ============ ios 本地化存储的方式 ============
    /*
    XML属性列表(plist)归档
    Preference(偏好设置)
    NSKeyedArchiver归档(NSCoding)
     */
    
    YYLabel * views = [[YYLabel alloc]init];
    views.frame =CGRectMake(0,20 , ScreenWidth, 300);
    views.numberOfLines=0;
    views.text=@"要想在本地存储数据，那就要知道一下什么是应用沙盒 ,其实很好理解应用沙盒就是应用的文件夹，与其他文件系统隔离。每一个iOS应用都有自己的应用沙盒，应用必须待在自己的沙盒里，其它应用不能访问该沙盒。如何获取应用沙盒路径，可以通过打印NSHomeDirectory()来获取应用沙盒路径--------------plist文件----------plist的根Type只能是字典（NSDictionary）或者是数组（NSArray）所以归档时我们只能将数组或字典保存到plist文件中，但是NSString也能通过归档保存到plist文件中同时它也可以通过stringWithContentsOfFile解档，它保存到plist中时Type是空的，Value是有值的！";
    views.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:views];
    
    
//    沙盒根目录的获取方式
    NSString *home = NSHomeDirectory();
    NSLog(@"%@",home);
    
//    Documents文件夹的获取方式（3种）
    
    // NSDocumentDirectory 要查找的文件
    // NSUserDomainMask 代表从用户文件夹下找
    // 在iOS中，只有一个目录跟传入的参数匹配，所以这个集合里面只有一个元素
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"sjj.plist"];
    
    NSLog(@"filePath------%@",filePath);

    
//  Library/Caches文件夹的获取方式
//    第一个参数不同
    NSString *path1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath1 = [path1 stringByAppendingPathComponent:@"student.data"];
    
    NSLog(@"filePath1------%@",filePath1);
    
    
    //    Library/Preference文件夹的获取方式---偏好设置
//    通过NSUserDefaults类存取该目录下的设置信息!--XML属性列表（plist）归档
    
//    plist文件的归档
    NSArray *arr = [[NSArray alloc] initWithObjects:@"1", @"2", nil];
    // NSDocumentDirectory 要查找的文件
    // NSUserDomainMask 代表从用户文件夹下找
    // 在iOS中，只有一个目录跟传入的参数匹配，所以这个集合里面只有一个元素
    NSString *path2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath2 = [path2 stringByAppendingPathComponent:@"syj.plist"];
    [arr writeToFile:filePath2 atomically:YES];
    
//    plist文件的解档

    NSString *filePath3 = [path stringByAppendingPathComponent:@"syj.plist"];
    // 解档
    NSArray *arr1 = [NSArray arrayWithContentsOfFile:filePath2];
    NSLog(@"解档----------%@", arr1);
    

    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end



