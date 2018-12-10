//
//  SjjcollectionFooterView.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/8/2.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjcollectionFooterView.h"

@implementation SjjcollectionFooterView

+ (NSString *)footerViewIdentifire{
    static NSString * footerid = @"footerID";
    return footerid;
}

+ (instancetype)footerViewWithcollection:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    
    SjjcollectionFooterView *footerView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[SjjcollectionFooterView footerViewIdentifire] forIndexPath:indexPath];
    return footerView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;    
}
@end
