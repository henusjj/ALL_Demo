//
//  CommanBottomPopView.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/9/11.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "CommanBottomPopView.h"
#define LC_ACTION_SHEET_COLOR(r, g, b)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

@interface CommanBottomPopView ()

@property(nonatomic, weak) UIView *darkView;
@property(nonatomic, weak) UIView *customView;

@end

@implementation CommanBottomPopView

+ (instancetype)bottomPopWithCustomView:(UIView *)customView positionState:(PositionState)state{
    return [[self alloc] initWithCustomView:customView positionState:state];
}

- (instancetype)initWithCustomView:(UIView *)customView positionState:(PositionState)state{
    if (self = [super init]) {
        self.customView = customView;
        [self setupViewWithPosition:state];
    }
    return self;
}

- (void)setupViewWithPosition:(PositionState)state {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
  
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(keyWindow);
    }];
    if (self.customView) {
        UIView *darkView = [[UIView alloc] init];
        darkView.alpha = 0;
        darkView.userInteractionEnabled = NO;
        darkView.backgroundColor = LC_ACTION_SHEET_COLOR(46, 49, 50);
        [self addSubview:darkView];
       
        [darkView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.edges.equalTo(@(0));
        }];
        self.darkView = darkView;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(darkViewClicked)];
        [darkView addGestureRecognizer:tap];
        [self addSubview:self.customView];
        
        CGFloat height = CGRectGetHeight(self.customView.frame);
        CGFloat width = CGRectGetWidth(self.customView.frame);
        CGFloat top = [UIScreen mainScreen].bounds.size.height - height;
        
        
        if (state == PositionStateCenter) {
            [self.customView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self.mas_centerX);
                make.centerY.mas_equalTo(self.mas_centerY);
                make.height.mas_equalTo(@(height));
                make.width.mas_equalTo(@(width));
            }];
        } else if (state == PositionStateBottom) {
            [self.customView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(@(top));
                make.centerX.mas_equalTo(self.mas_centerX);
                make.height.mas_equalTo(@(height));
                make.width.mas_equalTo(@(width));
            }];
        } else {
            
        }
        
        self.customView.hidden = YES;
        return;
    }
}

- (void)darkViewClicked {
    [self hideSelf];
}

- (void)show {
    [self layoutIfNeeded];
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        weakSelf.darkView.alpha = .4;
        weakSelf.darkView.userInteractionEnabled = YES;
        if (weakSelf.customView) {
            weakSelf.customView.hidden = NO;
        }
        [weakSelf layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hideSelf {
    __weak typeof (self) weakSelf = self;
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        weakSelf.darkView.alpha = 0;
        weakSelf.darkView.userInteractionEnabled = NO;
        if (weakSelf.customView) {
            weakSelf.customView.hidden = YES;
        }
        [weakSelf layoutIfNeeded];
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

- (void)dealloc {
    NSLog(@"dealloc -- %@", [self class]);
}
@end
