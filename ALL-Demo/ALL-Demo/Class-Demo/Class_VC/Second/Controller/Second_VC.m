//
//  Second_VC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/5/30.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "Second_VC.h"
#import "SjjYYkitvViewControl.h"
#import "SjjMJExtensionVC.h"
//通讯录
#import "SjjphoneNumber.h"
#import <Contacts/Contacts.h>
#import "Sjjerweima.h"
#import "SjjziliaoVC.h"
#import "ViewController.h"

#import "SjjpopViewController.h"


@interface Second_VC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation Second_VC{
    NSArray *arryNum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    arryNum = @[@"YYkit的使用",@"MJExtension",@"SDAutoLayout",@"手机通讯录",@"二维码界面",@"扫一扫",@"资料设置",@"弹出视图",@"图片浏览器"];
}

#pragma mark table--delegate---dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arryNum.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = arryNum[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            SjjYYkitvViewControl *vc = [[SjjYYkitvViewControl alloc]init];
            vc.title = @"YYkit组件化应用";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            SjjMJExtensionVC *vc =[[SjjMJExtensionVC alloc]init];
            vc.title = @"数据结构的几种解析模式";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            //Privacy - Contacts Usage Description     info.plish里面设置添加上
//            [self requestContactAuthorAfterSystemVersion9];
            SjjphoneNumber *vc = [[SjjphoneNumber alloc]init];
//            vc.jsonNumber = jsonString;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            Sjjerweima *vc=[[Sjjerweima alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:{
//            扫一扫第三方，自定义强
            ViewController *vc = [[ViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:{
            SjjziliaoVC *vc = [[SjjziliaoVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:{
//            弹出框
            SjjpopViewController *vc =[[SjjpopViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8:{
//            图片浏览器
//            http://flv3.bn.netease.com/tvmrepo/2018/6/H/9/EDJTRBEH9/SD/EDJTRBEH9-mobile.mp4
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//请求通讯录权限
#pragma mark 请求通讯录权限
- (void)requestContactAuthorAfterSystemVersion9{
    
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusNotDetermined) {
        CNContactStore *store = [[CNContactStore alloc] init];
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError*  _Nullable error) {
            if (error) {
                NSLog(@"授权失败");
            }else {
                NSLog(@"成功授权");
            }
        }];
    }
    else if(status == CNAuthorizationStatusRestricted)
    {
        NSLog(@"用户拒绝");
        [self showAlertViewAboutNotAuthorAccessContact];
    }
    else if (status == CNAuthorizationStatusDenied)
    {
        NSLog(@"用户拒绝");
        [self showAlertViewAboutNotAuthorAccessContact];
    }
    else if (status == CNAuthorizationStatusAuthorized)//已经授权
    {
        //有通讯录权限-- 进行下一步操作
        [self openContact];
    }
    
}


//有通讯录权限-- 进行下一步操作
- (void)openContact{
    // 获取指定的字段,并不是要获取所有字段，需要指定具体的字段
    NSArray *keysToFetch = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc] initWithKeysToFetch:keysToFetch];
    CNContactStore *contactStore = [[CNContactStore alloc] init];
     NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:10];
    [contactStore enumerateContactsWithFetchRequest:fetchRequest error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        NSLog(@"-------------------------------------------------------");
        
        NSString *givenName = contact.givenName;
        NSString *familyName = contact.familyName;
        NSLog(@"givenName=%@, familyName=%@", givenName, familyName);
        //拼接姓名
        NSString *nameStr = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
        
        NSArray *phoneNumbers = contact.phoneNumbers;
        
        //        CNPhoneNumber  * cnphoneNumber = contact.phoneNumbers[0];
        
        //        NSString * phoneNumber = cnphoneNumber.stringValue;
        
        for (CNLabeledValue *labelValue in phoneNumbers) {
            //遍历一个人名下的多个电话号码
            NSString *label = labelValue.label;
//            NSString *phoneNumber = labelValue.value;
            CNPhoneNumber *phoneNumber = labelValue.value;

            NSString *string = phoneNumber.stringValue ;

            //去掉电话中的特殊字符
            string = [string stringByReplacingOccurrencesOfString:@"+86" withString:@""];
            string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
            string = [string stringByReplacingOccurrencesOfString:@"(" withString:@""];
            string = [string stringByReplacingOccurrencesOfString:@")" withString:@""];
            string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
            string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];

            NSLog(@"姓名=%@, 电话号码是=%@", nameStr, string);

            [dic setValue:nameStr forKey:string];

        }
        
        //    *stop = YES; // 停止循环，相当于break；
        
    }];
    NSLog(@"------%@",dic);
    [self jsonStringWithDict:dic];
}





//提示没有通讯录权限
- (void)showAlertViewAboutNotAuthorAccessContact{
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"请授权通讯录权限"
                                          message:@"请在iPhone的\"设置-隐私-通讯录\"选项中,允许花解解访问你的通讯录"
                                          preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:OKAction];
    [self presentViewController:alertController animated:YES completion:nil];
}





#pragma mark ============ 字典转json ============

- (void)jsonStringWithDict:(NSDictionary *)dict {
    NSError *error;
    
    // 注
    //NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingSortedKeys error:&error];
    
    // NSJSONWritingSortedKeys这个枚举类型只适用iOS11所以我是使用下面写法解决的
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:nil error:&error];
    
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSLog(@"zif=======%@",jsonString);
    
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
