//
//  Sjj-cycleScroller.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/6/20.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "Sjj-cycleScroller.h"

//宏定义scrollview的宽高
#define view_WIDTH self.frame.size.width
#define view_HEIGHT self.frame.size.height
@interface Sjj_cycleScroller()<UIScrollViewDelegate>

@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSTimer *timer;//定时器
@property(nonatomic,copy)NSArray *imagesArray;//图片数组

@end

@implementation Sjj_cycleScroller{
    ///存放3个UIImageView的数组
    NSMutableArray *_imageViews;
}

-(instancetype)initWithFrame:(CGRect)frame imageGroups:(NSArray<NSString *> *)imageGroups{
    if (self = [super initWithFrame:frame]) {
        
        _imagesArray = imageGroups;
        
        [self initView];
        // 创建一个定时器
        [self startTimer];
    }
    return self;
}

-(void)initView{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.contentSize = CGSizeMake(view_WIDTH * 3, view_HEIGHT);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    //设置scrollview一开始的偏移量为一个宽度,因为里面有3个UIImageView,所以scrollview默认显示的就是(0,1,2)里面的第一个imageview
    self.scrollView.contentOffset = CGPointMake(view_WIDTH, 0);
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    //初始化imageview
    _imageViews = [NSMutableArray array];
    //创建三个imageView作为循环复用的载体，图片将循环加载在这三个imageView上面
    for (NSInteger i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(view_WIDTH * i, 0, view_WIDTH,view_HEIGHT);
        //(self.dataArray.count - 1 + i)%self.dataArray.count也可以达到让一开始3个imageview分别显示最后一张<-->第一张<-->第二张图片,但是让大家理解起来会有一定难度,所以采用下面最简单的方法直接设置
        //imageView.tag = (self.dataArray.count - 1 + i)%self.dataArray.count;
        
        //3个imageview一开始需要的图片分别对应图片数组的图片索引应该是imageview[0].index-->images.count-1,imageview[1].index-->0,imageview[2].index-->1
        NSInteger index = 0;
        if (i == 0) index = _imagesArray.count - 1;
        if (i == 1) index = 0;
        if (i == 2) index = 1;
        
        imageView.tag = index;
        imageView.userInteractionEnabled = YES;
//        imageView.layer.shadowColor = [UIColor grayColor].CGColor;
//        imageView.layer.shadowOffset = CGSizeMake(10, 10);
//        imageView.layer.shadowOpacity = 0;
//        imageView.layer.cornerRadius = 10;
//        imageView.layer.masksToBounds = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [imageView addGestureRecognizer:tap];
        //设置imageView上的image图片
        [self setImageView:imageView atIndex:index];

        //将imageView加入数组中，方便随后取用
        [_imageViews addObject:imageView];
        [self.scrollView addSubview:imageView];
        
        
        
        //初始化pageControl,最后添加,这样它会显示在最前面,不会被遮挡
    }
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame) - 30, view_WIDTH, 30)];
        self.pageControl.numberOfPages = _imagesArray.count;
       
        self.pageControl.pageIndicatorTintColor=[UIColor whiteColor];
        self.pageControl.currentPageIndicatorTintColor=[UIColor redColor];
        self.pageControl.currentPage = 0;
        [self addSubview:self.pageControl];

    
}
- (void)setImageView:(UIImageView *)imageView atIndex:(NSInteger)index
{
    
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",_imagesArray[index]]];
    
}

- (void)startTimer {
    // scheduled 计划
    /**
     scheduledTimerWithTimeInterval 间隔
     target     通过谁调用下面的方法
     selector   方法
     userInfo  : 传递的参数
     repeats : 是否重复执行 方法
     */
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.5
                                              target:self
                                            selector:@selector(changeImage)
                                            userInfo:nil
                                             repeats:YES];
    
    // 调整timer 的优先级
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    
    [mainLoop addTimer:_timer forMode:NSRunLoopCommonModes];
}



-(void)tapGesture:(UITapGestureRecognizer *)tap{
    
    if ([self.delegate respondsToSelector:@selector(cycleScroller:didSelectItemAtIndex:)]) {
        [self.delegate cycleScroller:self didSelectItemAtIndex:tap.view.tag];
    }
}


- (void)changeImage {
    //NSLog(@"定时器的%f",_scrollView.contentOffset.x);
    //定时器方法都是相当于向左滑动,偏移量是增大的,原本偏移量是一倍的宽度,定时器方法执行一次,偏移量就要增大一个宽度,这样也就是setContentOffset:CGPointMake(VIEW_WIDTH * 2, 0),相当于设置偏移量是2倍宽度
    //执行了setContentOffset:方法,系统会自动调用scrollViewDidEndScrollingAnimation:方法,在这个方法里面再设置回偏移量等于一倍的宽度,同时更换各个imageview的图片,那么还是相当于中间的那个imageview显示在屏幕上
    [self.scrollView setContentOffset:CGPointMake(view_WIDTH * 2, 0) animated:YES];
}
//停止定时器
- (void)stopTimer {
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
#pragma mark - <UIScrollViewDelegate代理方法>
//用户开始拖拽,停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
    
}

//用户停止拖拽,开启定时器
- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
    
}

//人为拖拽停止并且减速完全停止时会调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //在已经减速结束的时候进行图片更新，pagecontrol的更新
    [self updateImageViewsAndPageControl];
}

//在调用setContentOffset方法的时候，会触发此代理方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    //在调用setContentOffset方法的时候，会触发此代理方法（避免在定时器控制偏移量的时候不刷新UI）
    [self updateImageViewsAndPageControl];
    
    // NSLog(@"滚动后的%f",_scrollView.contentOffset.x);
}


#pragma mark - 更新图片和分页控件的当前页
- (void)updateImageViewsAndPageControl {
    //先判断出scrollview的操作行为是向左向右还是不动
    //定义一个flag,目前是让scrollview向左向右滑动的时候索引对应的+1或者-1
    int flag = 0;
    if (self.scrollView.contentOffset.x > view_WIDTH)
    {//手指向左滑动
        flag = 1;
    }
    else if (self.scrollView.contentOffset.x == 0)//原本偏移量是一个宽度,现在==0了,那么就是手指向右滑动了
    {//手指向右滑动
        flag = -1;
    }
    else
    {//除了向左向右之外就是没有移动,那么不需要任何操作，直接返回
        return;
    }
    
    //    NSInteger index = 0;
    //修改imageViews中的imageView的tag值，从而修改imageView上显示的image，pageControl的页码
    for (UIImageView *imageView in _imageViews) {
        /*
         （1）当屏幕中间那个imageview显示最后一张图片时，右边的ImageView,也即下一张图片应该是显示最开始的那一张图片(第0张)；
         
         （2）当屏幕中间显示最开始的那一张图片(第0张)时，左边的ImageView,也即上一张图片应该是最后一张图片。
         */
        NSInteger index = imageView.tag + flag ;
        
        if (index < 0) {
            index = self.pageControl.numberOfPages - 1;
        } else if (index >= self.pageControl.numberOfPages) {
            index = 0;
        }
        
        imageView.tag = index;
        //更新每一页上的image
      //  [self setImageWithImageView:imageView];
        [self setImageView:imageView atIndex:index];
    }
    //更新pageControl显示的页码,也就是中间那个imageview的tag值
    self.pageControl.currentPage = [_imageViews[1] tag];
    
    
    
    //使用无动画的效果快速切换,也就是把scrollview的偏移量还设置成一个imageview的宽度
    //这里是通过设置scrollview的偏移量让其来回滑动,时刻更换imageview的图片,每换一次,就立即让scrollview以无动画的方式再回到偏移量为一个imageview宽度的偏移量位置,即还是显示的中间那个imageview,以此给用户产生一种来回切换的错觉,实质一直是在显示中间那个imageview
    self.scrollView.contentOffset = CGPointMake(view_WIDTH, 0);
}





//控制器销毁的时候移除定时器
- (void)dealloc {
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
