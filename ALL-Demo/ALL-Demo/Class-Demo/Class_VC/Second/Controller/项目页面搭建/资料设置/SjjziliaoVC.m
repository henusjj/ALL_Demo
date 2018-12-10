//
//  SjjziliaoVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/10.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjziliaoVC.h"

@interface SjjziliaoVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *arrytitle;
@end

@implementation SjjziliaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"资料设置";
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-kTopHeight);
    self.tableView.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [self.view addSubview:self.tableView];
    self.arrytitle =[[NSArray alloc]init];
    self.arrytitle=@[@"备注名",@"把他推荐给朋友",@"加入黑名单"];
    [self creatfooterView];
}
-(void)creatfooterView{
    UIView *footerview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
    footerview.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    UIButton *exectbtn=[[UIButton alloc]initWithFrame: CGRectMake(15,166,ScreenWidth-30,36)];
    exectbtn.layer.cornerRadius = 6;
    exectbtn.backgroundColor=[UIColor colorWithRed:67/255.0 green:158/255.0 blue:255/255.0 alpha:1];
    [exectbtn setTitle:@"删除" forState:UIControlStateNormal];
    [exectbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [exectbtn addTarget:self action:@selector(delebtn) forControlEvents:UIControlEventTouchUpInside];
    [footerview addSubview:exectbtn];
    
    self.tableView.tableFooterView = footerview;
    
}
-(void)delebtn{
//    JQXAlertView * alert = [[JQXAlertView alloc]initWithMessage:@"你确定要删除好友吗" headerMessage:@"提示" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
//    [alert showWithCompletion:^(NSInteger selectIndex) {
//        if (selectIndex==0) {
//            return ;
//        }else{
//            
//            [IMNetModel deleteFriendWithUserId:@"" andDelUserId:self.friendId success:^(id  _Nonnull responObject) {
//                IM_PLZBaseM *baseM = [IM_PLZBaseM mj_objectWithKeyValues:responObject];
//                [JKAlert alertText:baseM.msg];
//                if (baseM.code==0) {
//                    [self.navigationController popToRootViewControllerAnimated:YES];
//                }
//            } failure:^(NSError * _Nonnull error) {
//                
//            }];
//        }
//    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrytitle.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qw"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"qw"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (indexPath.section ==0) {
        cell.textLabel.text = self.arrytitle[0];
        //    右边的小箭头设置
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text=@"henusjj";
    }else if (indexPath.section ==1){
        cell.textLabel.text = self.arrytitle[1];
        //    右边的小箭头设置
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.textLabel.text = self.arrytitle[2];
//        自定义accessoryType--delegate 有代理方法获取点击事件
        UISwitch *myswitch = [[UISwitch alloc]init];
        myswitch.on = NO;
        [myswitch addTarget:self action:@selector(switchofforOn:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = myswitch;
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(void)switchofforOn:(UISwitch *)sender{
    if (sender.on) {
        [MBProgressHUD showSuccess:@"加入黑名单"];
    }else{
        [MBProgressHUD showSuccess:@"移除黑名单"];
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
