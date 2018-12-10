//
//  SjjYYText.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/18.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjYYText.h"

@interface SjjYYText ()
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIScrollView *scrollview;
@end

@implementation SjjYYText{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollview = [[UIScrollView alloc]init];
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.pagingEnabled=NO;
    self.scrollview.showsHorizontalScrollIndicator =NO;
    [self.view addSubview:self.scrollview];
    [self.scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.bgView =[[UIView alloc]init];
    [self.scrollview addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollview);
    }];
    
    UILabel *lable = [[UILabel alloc]init];
    lable.font=[UIFont systemFontOfSize:15];
    lable.textColor =[UIColor blackColor];
    lable.textAlignment = NSTextAlignmentLeft;
    lable.numberOfLines=0;
    lable.text=@"（GitHub：https://github.com/ibireme/YYText）功能强大的 iOS 富文本编辑与显示框架。   特性：API 兼容 UILabel 和 UITextView  ,     支持高性能的异步排版和渲染, 扩展了 CoreText 的属性以支持更多文字效果 ,     支持 UIImage、UIView、CALayer 作为图文混排元素 ,       支持添加自定义样式的、可点击的文本高亮范围,        支持自定义文本解析 (内置简单的 Markdown/表情解析) ,支持文本容器路径、内部留空路径的控制, 支持文字竖排版，可用于编辑和显示中日韩文本 ,支持图片和富文本的复制粘贴 ,文本编辑时，支持富文本占位符 ,支持自定义键盘视图 ,撤销和重做次数的控制 ,富文本的序列化与反序列化支持 ,支持多语言，支持 VoiceOver ,支持 Interface Builder ,全部代码都有文档注释";
    [self.bgView addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.bgView).offset(10);
        make.right.equalTo(self.bgView).offset(-10);
        make.width.equalTo(@(ScreenWidth-20));
    }];
    
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
