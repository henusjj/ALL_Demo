//
//  SjjcollectionVC.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/7/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjcollectionVC.h"
#import "SjjcollectionOneCell.h"
#import "SjjcollectionHeaderView.h"
#import "SjjcollectionModel.h"
#import "Sjjtwomodel.h"
#import "SjjimgModel.h"

#import "sjjCollectionViewController.h"

@interface SjjcollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSArray *aryy;
@property(nonatomic,strong)SjjcollectionModel *result;
@property(nonatomic,strong)UIBarButtonItem *right;
@property(nonatomic,assign)BOOL isseclet;

//外部记录是否已经点击的状态
@property(nonatomic,strong)NSMutableDictionary *didselse;

@property(nonatomic,strong)NSMutableArray *section;
@property(nonatomic,strong)NSMutableArray *row;
//
@property(nonatomic,strong)NSMutableArray *dataAreey;
@property(nonatomic,strong)NSMutableArray *seletArry;


@end

@implementation SjjcollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"图片和视频";
    self.right= [[UIBarButtonItem alloc]initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(xuanzhe:)];
    self.isseclet = NO;
    [self.right setTintColor:[UIColor blueColor]];
    self.navigationItem.rightBarButtonItem=self.right;
    self.section=[[NSMutableArray alloc]init];
    self.row=[[NSMutableArray alloc]init];
    
    [self initdata];
    
#pragma mark ============ ============

    
    /**
     UICollectionView除了需要frame，还需要一个布局参数,UICollectionViewLayout类的对象，但我们一般使用它的子类UICollectionViewFlowLayout
     
     UICollectionView必须注册视图类，才能显示，不需要手动创建
     
     */
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((ScreenWidth - 10)/4, (ScreenWidth - 10)/4); //设置item的大小
    layout.scrollDirection = UICollectionViewScrollDirectionVertical; //设置布局方式
    layout.sectionInset = UIEdgeInsetsMake(2, 2,0, 2); //设置距离上 左 下 右
    layout.minimumLineSpacing =1;
    layout.minimumInteritemSpacing= 1;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth , ScreenHeight - kTopHeight - kTabBarHeight) collectionViewLayout:layout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.allowsMultipleSelection = YES;//设置允许多选
    self.collectionView.backgroundColor=[UIColor blackColor];
//    注册itemcell类
    [self.collectionView registerClass:[SjjcollectionOneCell class] forCellWithReuseIdentifier:@"cellid"];
//    注册header头
    [self.collectionView registerClass:[SjjcollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerid" ];
    
    [self.view addSubview:self.collectionView];
    
    
//    底部ui
    UIButton *dele=[[UIButton alloc]init];
    [dele setTitle:@"删除" forState:UIControlStateNormal];
    [dele setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dele addTarget:self action:@selector(delecell) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dele];
    [dele mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(0);
        make.left.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view).offset(0);
        
    }];
    
}
#pragma mark ============ 请求数据 ============

-(void)initdata{
    NSDictionary *arrydata=@{
                             
                             @"data":@[
                                     @{
                                         @"date":@"2019-1-1",
                                         @"img":@[
                                                 @{@"ids":@"http://flv3.bn.netease.com/tvmrepo/2018/6/H/9/EDJTRBEH9/SD/EDJTRBEH9-mobile.mp4",
                                                   @"smalimh":@"https://ph-images.oss-cn-shenzhen.aliyuncs.com/upload/member/20180906/20180906173513866611467.png",
                                                   },
                                                 @{@"ids":@"https://ph-images.oss-cn-shenzhen.aliyuncs.com/upload/member/20180906/20180906173513866611467.png",
                                                   
                                                   },
                                                 @{@"ids":@"http://flv3.bn.netease.com/tvmrepo/2018/6/H/9/EDJTRBEH9/SD/EDJTRBEH9-mobile.mp4",
                                                   @"smalimh":@"https://ph-images.oss-cn-shenzhen.aliyuncs.com/upload/member/20180906/20180906173513866611467.png",
                                                   },
                                                 @{@"ids":@"https://ph-images.oss-cn-shenzhen.aliyuncs.com/upload/member/20180906/20180906173513866611467.png"
                                                   
                                                   },
                                                 
//                                                 @{@"ids":@"0"},
//                                                  @{@"ids":@"1"},
//                                                  @{@"ids":@"2"},
//                                                  @{@"ids":@"3"},
//                                                  @{@"ids":@"4"},
//                                                  @{@"ids":@"5"},
//                                                   @{@"ids":@"6"},
//                                                  @{@"ids":@"7"},
//                                                  @{@"ids":@"8"},
                                                 
                                                 
                                                 ]
                                         },
//                                     @{
//                                         @"date":@"2010-7-7",
//                                         @"img":@[
//                                                 @{@"ids":@"http://flv3.bn.netease.com/tvmrepo/2018/6/H/9/EDJTRBEH9/SD/EDJTRBEH9-mobile.mp4"},
//                                                 @{@"ids":@"https://ph-images.oss-cn-shenzhen.aliyuncs.com/upload/member/20180906/20180906173513866611467.png"},
//
//                                                 ]
//                                         },
                                     ]
                             
                             
                             };
    //    处理请求成功后的数据
    self.result = [SjjcollectionModel mj_objectWithKeyValues:arrydata];
    //    将数据中的数组取出
    self.dataAreey = [[NSMutableArray alloc]init];
    self.seletArry = [[NSMutableArray alloc]init];
    
    self.dataAreey = (NSMutableArray*)self.result.data;

    //    存储选中cell时需要的数据
    self.didselse =[[NSMutableDictionary alloc]init];
    
    [self.collectionView reloadData];
    
}


//delecell
-(void)delecell{
    NSLog(@"点击了删除");
//
    NSLog(@"section%@----------row%@",self.section,self.row);
////    当点击删除的时候，根据section，row数组，删除self.dataAreey，self.seletArry数组中的元素
//
    int count=0;
//    NSMutableIndexSet *indexset = [[NSMutableIndexSet alloc]init];
    for (NSString *i in self.section) {
        Sjjtwomodel *model = self.dataAreey[i.intValue];
        self.seletArry = (NSMutableArray *)model.img;
        NSString *j=[NSString stringWithFormat:@"%@",self.row[count]];
//        [indexset addIndex:j.intValue];
//        [self.seletArry removeObjectAtIndex:j.intValue];
        NSDictionary *dic =[[NSDictionary alloc]init];
        dic = [NSDictionary dictionaryWithObject:j forKey:@"ids"];
        for (int m = 0;m<self.seletArry.count;m++) {
            SjjimgModel *model = self.seletArry[m];
            NSMutableDictionary *dic2=[[NSMutableDictionary alloc]init];
            [dic2 setValue:model.ids forKey:@"ids"];
            if ([dic2 isEqualToDictionary:dic]) {
                [self.seletArry removeObjectAtIndex:m];
            }
        }
        
        count ++;

    }
//    [self.seletArry removeObjectsAtIndexes:indexset];

    [self.collectionView reloadData];
    NSLog(@"%@--------%@",self.dataAreey,self.seletArry);
    [self.section removeAllObjects];
    [self.row removeAllObjects];
    

}


-(void)xuanzhe:(UIButton *)sender{
   NSInteger count = self.result.data.count;
    if (!self.isseclet) {//点击了选择
        
        for (int i = 0; i< count; i++) {
            Sjjtwomodel *model = self.result.data[i];
            SjjimgModel *model2;
            for (model2 in model.img) {
                    model2.isselectbtn=@"1";
            }
        }
        [self.collectionView reloadData];
        self.right= [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(xuanzhe:)];
        self.navigationItem.rightBarButtonItem=self.right;
        [self.right setTintColor:[UIColor blueColor]];
        self.isseclet = YES;
        
        //---

        
        
    }else{//点击了取消
        for (int i = 0; i< count; i++) {
            Sjjtwomodel *model = self.result.data[i];
            SjjimgModel *model2;
            for (model2 in model.img) {
                model2.isselectbtn=@"0";
               
            }
        }
        
        [self.collectionView reloadData];
        self.right= [[UIBarButtonItem alloc]initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(xuanzhe:)];
        self.navigationItem.rightBarButtonItem=self.right;
        [self.right setTintColor:[UIColor blueColor]];
        self.isseclet = NO;
//        //打印选中的数据
//        NSLog(@"------%@",self.didselse);
//        //        打印section
//        NSLog(@"section--%@",self.section);
//        //        打印row
//        NSLog(@"row---%@",self.row);
         [self.didselse removeAllObjects];
        [self.section removeAllObjects];
        [self.row removeAllObjects];
    }
    
}

#pragma mark ============ source ============

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return self.result.data.count;
    return self.dataAreey.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    Sjjtwomodel *model = self.result.data[section];
//    return model.img.count;
    
   Sjjtwomodel *model =self.dataAreey[section];
    self.seletArry = (NSMutableArray *)model.img;
    return self.seletArry.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Sjjtwomodel *model = self.dataAreey[indexPath.section];
    self.seletArry = (NSMutableArray *)model.img;
    SjjimgModel *model2=self.seletArry[indexPath.row];
    
    SjjcollectionOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    cell.backgroundColor= [UIColor whiteColor];
    cell.model=model2;
    
//    NSLog(@"------cell----%@",cell.labe.text);
    return cell;
}

//headerView
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    SjjcollectionHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerid" forIndexPath:indexPath];
    Sjjtwomodel *model = self.result.data[indexPath.section];

    view.text.text = model.date;
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.5;
    view.text.textColor = [UIColor whiteColor];
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(ScreenWidth, 45);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isseclet) {//如果是需要选择图片的时候
        SjjcollectionOneCell *cell = (SjjcollectionOneCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];//获取cell
//        修改cell
        cell.select.backgroundColor=[UIColor redColor];
         NSLog(@"选中按钮被点击:%ld        %ld",(long)indexPath.section,(long)indexPath.row);
        
        //存储选中的数据，通过section和rwo
//        Sjjtwomodel *model =self.result.data[indexPath.section];
//        SjjimgModel *model2 = model.img[indexPath.row];
        Sjjtwomodel *model = self.dataAreey[indexPath.section];
        self.seletArry = (NSMutableArray *)model.img;
        SjjimgModel *model2 = self.seletArry[indexPath.row];
        NSString *keynumber=[NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
        [self.didselse setObject:model2.ids forKey:keynumber];
        
        [self.section addObject:[NSNumber numberWithLong:indexPath.section]];
//        [self.row addObject:[NSNumber numberWithLong:indexPath.row]];
        [self.row addObject:model2.ids];
        
    }else{
        sjjCollectionViewController *vc =[[sjjCollectionViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isseclet) {//如果是需要选择图片的时候
        SjjcollectionOneCell *cell = (SjjcollectionOneCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];//获取cell
        //        修改cell
        cell.select.backgroundColor=[UIColor whiteColor];
        NSLog(@"取消-----:%ld        %ld",(long)indexPath.section,(long)indexPath.row);
        
//        移除取消的cell数据
        NSString *keynumber=[NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
        [self.didselse removeObjectForKey:keynumber];
        [self.section removeObject:[NSNumber numberWithLong:indexPath.section]];
//        [self.row removeObject:[NSNumber numberWithLong:indexPath.row]];
        
        Sjjtwomodel *model = self.dataAreey[indexPath.section];
        self.seletArry = (NSMutableArray *)model.img;
        SjjimgModel *model2 = self.seletArry[indexPath.row];
        [self.row removeObject:model2.ids];
    }else{
        
    }
}


#pragma mark ============ 获取cell上button的点击事件出现 ============
/*
 在cellforrom中加上
 //
 //        UIButton *deviceImageButton = cell.select;
 //        [deviceImageButton addTarget:self action:@selector(deviceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
 //
 */

-(void)deviceButtonPressed:(UIButton *)sender{
    UIView *v = [sender superview];//获取父类view
    SjjcollectionOneCell *cell = (SjjcollectionOneCell *)[v superview];//获取cell
    NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];//获取cell对应的indexpath;
    NSLog(@"设备图片按钮被点击:%ld        %ld",(long)indexpath.section,(long)indexpath.row);
    
    [self changbutton:indexpath.section androw:indexpath.row];
    
}
-(void)changbutton:(NSInteger)section androw:(NSInteger)row{
    
}
#pragma mark ============ 截止上方中间部分获取button的点击输出 ============

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
