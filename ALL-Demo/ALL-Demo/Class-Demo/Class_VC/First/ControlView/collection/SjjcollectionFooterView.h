//
//  SjjcollectionFooterView.h
//  ALL-Demo
//
//  Created by 史玉金 on 2018/8/2.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SjjcollectionFooterView : UICollectionReusableView
@property(nonatomic,strong)UILabel *textLable;
+(NSString *)footerViewIdentifire;
+(instancetype)footerViewWithcollection:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
@end
