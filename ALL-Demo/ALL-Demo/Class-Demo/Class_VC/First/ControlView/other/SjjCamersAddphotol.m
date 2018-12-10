//
//  SjjCamersAddphotol.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/3.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjCamersAddphotol.h"

/*
 uiimgpickviewVC 不支持多选
 */
@interface SjjCamersAddphotol ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property(nonatomic,strong)UIScrollView *scrollerview;
@property(nonatomic,strong)UIImageView *headerImg;

@end

@implementation SjjCamersAddphotol

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"系统原生调用相机相册";
    self.scrollerview=[[UIScrollView alloc]init];
    self.scrollerview.backgroundColor=[UIColor whiteColor];
    self.scrollerview.showsVerticalScrollIndicator = NO;
    self.scrollerview.showsHorizontalScrollIndicator = NO;
    self.scrollerview.pagingEnabled = NO;
    [self.view addSubview:self.scrollerview];
    [self.scrollerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
//    创建UI
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 135)];
    //    headerView.backgroundColor=[UIColor blueColor];
    headerView.layer.borderWidth = 0.5;
    headerView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:headerView];
    UIImageView *img=[[UIImageView alloc]init];
    img.backgroundColor=[UIColor grayColor];
    img.layer.masksToBounds = YES;
    img.layer.cornerRadius = 55/2;
    img.userInteractionEnabled =YES;
    [headerView addSubview:img];
    self.headerImg = img ;
    [self.headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
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
    WS(weakSelf);
    UIAlertController *alter=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIImagePickerController *imagePicker =[[UIImagePickerController alloc]init];
    

    UIAlertAction *action=[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了相机");
//        判断系统是否支持相机
       UIImagePickerController *imagePicker =[[UIImagePickerController alloc]init];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.allowsEditing =YES;
            imagePicker.delegate = self;//设置代理
            /*
             UIImagePickerControllerSourceTypePhotoLibrary,
             UIImagePickerControllerSourceTypeCamera,
             UIImagePickerControllerSourceTypeSavedPhotosAlbum
             */
            imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;//图片来源
            /*
             UIImagePickerControllerCameraCaptureModePhoto,
             UIImagePickerControllerCameraCaptureModeVideo
             */
//            设置拍摄照片
            imagePicker.cameraCaptureMode =UIImagePickerControllerCameraCaptureModePhoto;
            
            // 设置使用手机的后置摄像头（默认使用后置摄像头）
            imagePicker.cameraDevice =UIImagePickerControllerCameraDeviceRear;
            
            [weakSelf presentViewController:imagePicker animated:YES completion:nil];
        }else{
            NSLog(@"相机不可用");
        }
        
    }];
    UIAlertAction *potol =[UIAlertAction actionWithTitle:@"手机相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了相册");
        imagePicker.allowsEditing =YES;
        imagePicker.delegate = self;//设置代理
        imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        [weakSelf presentViewController:imagePicker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *cancle =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        点击了取消
        NSLog(@"点击了取消");

    }];
    
    [alter addAction:action];
    [alter addAction:potol];
    [alter addAction:cancle];
    
    [self presentViewController:alter animated:YES completion:nil];
}

#pragma mark ImgpickViewdelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
//    通过key值获取到图片
    /*
     UIKIT_EXTERN NSString *const UIImagePickerControllerOriginalImage __TVOS_PROHIBITED;  // a UIImage
     UIKIT_EXTERN NSString *const UIImagePickerControllerEditedImage __TVOS_PROHIBITED;    // a UIImage
     */
    UIImage *imge=[info objectForKey:UIImagePickerControllerEditedImage];
    
    self.headerImg.image=imge;
    
    //上传图片到服务器--在这里进行图片上传的网络请求，这里不再介绍
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
