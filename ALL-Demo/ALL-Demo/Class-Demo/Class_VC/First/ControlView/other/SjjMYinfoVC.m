//
//  SjjMYinfoVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/2.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjMYinfoVC.h"
#import "Sjjaddress.h"
#import "SjjmyinfoImage.h"
@interface SjjMYinfoVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SjjMYinfoVC{
    NSArray *infolist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-kTopHeight);
    [self.view addSubview:self.tableView];
    [self creatFooter];
    infolist=@[@"个人信息",@"收货地址",@"微信",@"qq",@"修改登录密码",@"修改交易密码",@"实名认证",@"意见反馈",@"清除缓存",@"版本更新"];
    
    NSLog(@"%f",self.tableView.frame.size.width);
}
//tableview footer
-(void)creatFooter{
    UIView *footerview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    footerview.backgroundColor=[UIColor whiteColor];
    UIButton *exectbtn=[[UIButton alloc]initWithFrame:CGRectMake(30, 10, ScreenWidth-60, 30)];
    exectbtn.backgroundColor=[UIColor redColor];
    [exectbtn setTitle:@"退出" forState:UIControlStateNormal];
    [exectbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [footerview addSubview:exectbtn];
    
    self.tableView.tableFooterView = footerview;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return infolist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"infocell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil ) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
    }
    cell.textLabel.text = infolist[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 2 || indexPath.row == 3) {
//        自定义accessoryType--delegate 有代理方法获取点击事件
        UISwitch *myswitch = [[UISwitch alloc]init];
        myswitch.on = NO;
        [myswitch addTarget:self action:@selector(switchofforOn:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = myswitch;
        
    }else if (indexPath .row == 8){
//              清除缓存,获取缓存
        cell.detailTextLabel.text = [self checkCache];
        
    }else{
//    右边的小箭头设置
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
//         个人信息
            SjjmyinfoImage *VC = [[SjjmyinfoImage alloc]init];
//            VC.title = @"个人信息";
            [self.navigationController pushViewController:VC animated:YES];
            
        }
            break;
        case 1:{
//            收货地址
            Sjjaddress *vc = [[Sjjaddress alloc]init];
            vc.title =@"收货地址";
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 8:{
//            清除缓存
            NSString * path =  [NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject];
            [self clearCache:path];
//            指定刷新cell
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:8 inSection:0];
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        }
            break;
        default:
            break;
    }

}

-(void)switchofforOn:(UISwitch *)sender{
    //获取点击按钮对应的cell
    UISwitch *switchInCell = (UISwitch *)sender;
    //UISwitch的superview就是cell
    UITableViewCell * cell = (UITableViewCell*) switchInCell.superview;
    NSIndexPath * indexpath = [self.tableView indexPathForCell:cell];
    
    NSLog(@"%ld",indexpath.row);
    
    if (indexpath) {
        [self tableView:self.tableView accessoryButtonTappedForRowWithIndexPath:indexpath];
    }
    
    
//    判断
    switch (indexpath.row) {
        case 2:
            {
                if (sender.on) {
                    [MBProgressHUD showSuccess:@"绑定了微信"];
                }else{
                    [MBProgressHUD showSuccess:@"已取消绑定微信"];
                }
            }
            break;
        case 3:{
            if (sender.on) {
                [MBProgressHUD showSuccess:@"绑定了qq"];
            }else{
                [MBProgressHUD showSuccess:@"已取消绑定qq"];
            }
        }
            break;
            
        default:
            break;
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
  
    NSLog(@"点击了开关按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ------- 计算缓存
- (NSString *)checkCache {
    NSString * path =  [NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject];
    
    float totalSize = 0;
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
    for (NSString *fileName in fileEnumerator)
    {
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        
        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        
        unsigned long long length = [attrs fileSize];
        
        totalSize += length;
    }
    // NSLog(@"tmp size is %.2f",totalSize);
    
    NSString * hcStr = [NSString stringWithFormat:@"%f",totalSize/1024];
    
    NSRange range = [hcStr rangeOfString:@"."]; //现获取要截取的字符串位置
    hcStr = [hcStr substringToIndex:range.location]; //截取字符串
    
    if ([hcStr intValue]>1024) {
        
        hcStr = [NSString stringWithFormat:@"%ldM",[hcStr integerValue]/1024];
    }else{
        hcStr = [NSString stringWithFormat:@"%ldKB",[hcStr integerValue]];
        
    }
    return hcStr;
}

#pragma mark ---- 清空缓存
-(void)clearCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    BOOL isHave = [fileManager fileExistsAtPath:path];
    if (isHave) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        BOOL suc = NO;
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            BOOL isSuc = [fileManager removeItemAtPath:absolutePath error:nil];
            suc += isSuc;
        }
        if (suc) {
            [MBProgressHUD showSuccess:@"清除成功"];
        }
        else {
            [MBProgressHUD showSuccess:@"已没有可清除的信息了！"];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
}

@end
