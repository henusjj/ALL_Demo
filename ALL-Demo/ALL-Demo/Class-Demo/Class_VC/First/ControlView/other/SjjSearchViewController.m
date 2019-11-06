//
//  SjjSearchViewController.m
//  ALL-Demo
//
//  Created by GuoYanjun on 2019/10/8.
//  Copyright © 2019年 henusjj.com. All rights reserved.
//

#import "SjjSearchViewController.h"

@interface XUIView:UIView

@end

@implementation XUIView

-(CGSize)intrinsicContentSize
{
    return UILayoutFittingExpandedSize;
}
@end



@interface SjjSearchViewController ()<UISearchBarDelegate,UISearchResultsUpdating,UIAlertViewDelegate>
@property(nonatomic,strong)UISearchController *searchController;//搜索控制器
@property (strong, nonatomic)NSMutableArray  *searchList;//满足搜索条件的数组

@property(nonatomic,strong)UIView *titleView;

@property(nonatomic,assign)BOOL select;

@end


@implementation SjjSearchViewController


-(UISearchController *)searchController{
    if (!_searchController) {
        _searchController = [[UISearchController alloc]init];
    }
    return _searchController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtn)];
    
    UIButton *rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightBtn setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(searchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = right;
    
    
    UIView *titView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 44)];
    titView.backgroundColor = [UIColor yellowColor];
    self.titleView=titView;
    _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    _searchController.searchBar.translucent=YES;
    _searchController.searchBar.tintColor=[UIColor grayColor];
    _searchController.searchBar.barTintColor=[UIColor grayColor];
    //设置searchbar的边框颜色和背景颜色一致
//    _searchController.searchBar.layer.borderWidth=1;
//    _searchController.searchBar.layer.borderColor=[[UIColor grayColor] CGColor];
    _searchController.searchBar.placeholder=@"搜索联系人";
    _searchController.hidesNavigationBarDuringPresentation = NO;
    _searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    _searchController.searchBar.delegate=self;
    _searchController.searchBar.showsCancelButton = NO;
    _searchController.searchBar.frame=self.titleView.frame;
    [self.titleView addSubview:_searchController.searchBar];
    [self.searchController.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleView); make.top.equalTo(self.titleView).offset(0); make.bottom.equalTo(self.titleView).offset(0);
        
    }];
    self.titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
   
    
}

-(void)searchBtn{
    
    [UIView animateWithDuration:0.5 animations:^{
            self.navigationItem.titleView=self.titleView;
        
    } completion:^(BOOL finished) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleBtn)];
        
        self.navigationItem.rightBarButtonItem = right;
    }];
}
-(void)cancleBtn{
    [UIView animateWithDuration:0.5 animations:^{
        
    } completion:^(BOOL finished) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtn)];
        
        self.navigationItem.rightBarButtonItem = right;
    }];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.searchController.searchBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleView); make.top.equalTo(self.titleView).offset(0); make.bottom.equalTo(self.titleView).offset(0);
        
    }];
    
}
@end

