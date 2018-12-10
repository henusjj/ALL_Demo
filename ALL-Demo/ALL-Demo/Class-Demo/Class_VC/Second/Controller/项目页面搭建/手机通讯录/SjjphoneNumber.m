//
//  SjjphoneNumber.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/6.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjphoneNumber.h"
#import "SjjphoneCell.h"
#import "NSString+PinYin.h"
@interface SjjphoneNumber ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITextField *search;
@property(nonatomic,strong)NSArray *headerarry;
@end

@implementation SjjphoneNumber

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    
    [self.view addSubview:self.search];
    [self.search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
//        make.height.mas_equalTo(30);
        make.height.equalTo(@30);
    
    }];
     self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, ScreenWidth, ScreenHeight - kTopHeight -41) style:UITableViewStylePlain];
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    
    [self.view addSubview:self.tableView];
   
    [self initdata];
}
-(void)initdata{
    NSArray *array = @[@"登记", @"大奔", @"周傅",@"((((", @"啦文琪羊", @"   s文强", @"过段时间", @"等等", @"各个", @"宵夜**", @"***", @"贝尔",@"*而结婚*", @"返回***", @"你还", @"与非门*", @"是的", @"*模块*", @"*没做*",@"俄文", @"   *#咳嗽", @"6",@"fh",@"C罗",@"邓肯"];
    NSArray  *indexArray= [array arrayWithPinYinFirstLetterFormat];
    self.headerarry =[NSMutableArray arrayWithArray:indexArray];
    
    [self.tableView reloadData];
}


#pragma mark ============ 懒加载 ============
-(UITextField *)search{
    if (_search == nil) {
        _search = [[UITextField alloc]init];
        _search.placeholder = @"搜索联系人";
        _search.textAlignment = NSTextAlignmentCenter;
        _search.backgroundColor = VGColor(238, 238, 238);
    }
    return _search;
}

#pragma mark ============ tableViewdeleget ============

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.headerarry.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
    {
        return 1;
    }else{
        NSDictionary *dict = self.headerarry[section];
        NSMutableArray *array = dict[@"content"];
        return [array count];
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellid =@"112";
    SjjphoneCell *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell =[[SjjphoneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dict = self.headerarry[indexPath.section];
    NSMutableArray *array = dict[@"content"];
    cell.name.text = array[indexPath.row];
    
    cell.clickadd = ^{
        NSLog(@"点击了添加");
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *headerView = [[UIView alloc]init];
//    headerView.backgroundColor=[UIColor grayColor];
//    UILabel *lab=[[UILabel alloc]init];
//    lab.frame = CGRectMake(10, 0, 100, 30);
//    lab.font = [UIFont systemFontOfSize:13];
//    lab.textColor = [UIColor redColor];
//    lab.text =self.headerarry[section];
//    [headerView addSubview:lab];
//    return headerView;
    
    //自定义Header标题
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor colorWithRed:0.10 green:0.68 blue:0.94 alpha:0.7];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 22)];
    titleLabel.textColor=[UIColor whiteColor];
    
    NSString *title = self.headerarry[section][@"firstLetter"];
    titleLabel.text=title;
    [myView  addSubview:titleLabel];
    
    return myView;
}

#pragma mark---tableView索引相关设置----
//添加TableView头视图标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = self.headerarry[section];
    NSString *title = dict[@"firstLetter"];
    return title;
}

//添加索引栏标题数组
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *resultArray =[NSMutableArray arrayWithObject:UITableViewIndexSearch];
    for (NSDictionary *dict in self.headerarry) {
        NSString *title = dict[@"firstLetter"];
        [resultArray addObject:title];
    }
    return resultArray;
}


//点击索引栏标题时执行
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    if ([title isEqualToString:UITableViewIndexSearch])
    {
        [tableView setContentOffset:CGPointZero animated:NO];//tabview移至顶部
        return NSNotFound;
    }
    else
    {
        return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index] - 1; // -1 添加了搜索标识
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
