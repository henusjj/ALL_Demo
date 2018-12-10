//
//  SjjmyinfoImage.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/3.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjmyinfoImage.h"
#import "SjjalterView.h"
#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)
#define iOS11Later ([UIDevice currentDevice].systemVersion.floatValue >= 11.0f)
@interface SjjmyinfoImage ()<UIImagePickerControllerDelegate>

@property(nonatomic,strong)UIScrollView *scrollerview;

@property(nonatomic,strong)UIView *alterSheet;

@end

@implementation SjjmyinfoImage

-(UIView *)alterSheet{
    if (_alterSheet == nil) {
        NSArray *alter=@[@"拍照",@"从手机相册选择",@"取消"];
        _alterSheet = [SjjalterView creatAlterView:self andtitle:alter delegate:nil];
    }
    return _alterSheet;
}

//-(UIImagePickerController *)imagePickerVc{
////
//    if (_imagePickerVc == nil) {
//        _imagePickerVc = [[UIImagePickerController alloc]init];
//        _imagePickerVc.delegate = self;
//    }
//    return _imagePickerVc;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"选取图片使用第三方";
    self.scrollerview=[[UIScrollView alloc]init];
    self.scrollerview.backgroundColor=[UIColor whiteColor];
    self.scrollerview.showsVerticalScrollIndicator = NO;
    self.scrollerview.showsHorizontalScrollIndicator = NO;
    self.scrollerview.pagingEnabled = NO;
    [self.view addSubview:self.scrollerview];
    [self.scrollerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
//  创建UI
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 135)];
//    headerView.backgroundColor=[UIColor blueColor];
    headerView.layer.borderWidth = 0.5;
    headerView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:headerView];
    UIImageView *img=[[UIImageView alloc]init];
    img.backgroundColor=[UIColor grayColor];
    img.layer.cornerRadius = 55/2;
    img.userInteractionEnabled =YES;
    [headerView addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView);
        make.top.equalTo(headerView).offset(37);
        make.height.mas_equalTo(55);
        make.width.mas_equalTo(55);
    }];
//    给img添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(exctimg)];
    [img addGestureRecognizer:tap];
    
    
    
}
-(void)exctimg{
    NSLog(@"点击了图片");
//    alter 就是添加在window上的
      [[UIApplication sharedApplication].keyWindow addSubview:self.alterSheet];
}
//self.alterSheet 上btn的点击事件
-(void)btn:(UIButton *)sender{
    NSLog(@"%ld",sender.tag);
    switch (sender.tag) {
        case 1://拍照
            {
//                 原生调用相机相册
                [self camera];
            }
        break;
        case 2://手机相册选取
        {
            [self photol];
        }
        break;
        case 3://取消
        {
            [UIView animateWithDuration:0.3 animations:^{
                [self.alterSheet removeFromSuperview];
            }];
            
        }
        break;
        default:
            break;
    }
}

#pragma mark -打开相机
-(void)camera
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.alterSheet removeFromSuperview];
    }];
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES; //可编辑
    //判断是否可以打开照相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //摄像头
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        [self presentViewController:picker animated:YES completion:nil];
        [self presentViewController:picker animated:YES completion:^{
            

        }];
    }
    else{
        NSLog(@"没有摄像头");
    }
}

#pragma mark -打开相册
-(void)photol{
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.alterSheet removeFromSuperview];
    }];
    
    // 获取支持的媒体格式
    
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    // 判断是否支持需要设置的sourceType
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        UIImagePickerController *_imagePickerController=[[UIImagePickerController alloc] init];
        
        _imagePickerController.delegate=self;
        
        // 1、设置图片拾取器上的sourceType
        
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        // 2、设置支持的媒体格式
        
        //_imagePickerController.mediaTypes = @[mediaTypes[0]];
        
        // 3、其他设置
        
        _imagePickerController.allowsEditing = YES; // 如果设置为NO，当用户选择了图片之后不会进入图像编辑界面。
        
        // 4、推送图片拾取器控制器
        
        [self presentViewController:_imagePickerController animated:YES completion:^{
            
            NSLog(@"dakai");
            
            
        }];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
