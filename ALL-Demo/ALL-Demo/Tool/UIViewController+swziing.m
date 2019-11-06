//
//  UIViewController+swziing.m
//  Runtime
//
//  Created by 史玉金 on 2018/10/26.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "UIViewController+swziing.h"
#import "objc/runtime.h"
@implementation UIViewController (swziing)

//load方法会在类第一次加载的时候被调用
//调用的时间比较靠前，适合在这个方法里做方法交换
+(void)load{
    //方法交换应该被保证，在程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        获取xviewVC的系统方法
        SEL systemSel = @selector(viewWillAppear:);
        ////自己实现的将要被交换的方法的selector
        SEL swizzle = @selector(swiz_viewWillAppear:);
//        两个方法的Mothod---获取通过SEL获取一个方法(class_getInstanceMethod)
        Method sysmoth = class_getInstanceMethod([self class], systemSel);
        Method swizmoth = class_getInstanceMethod([self class], swizzle);
        
        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizmoth), method_getTypeEncoding(swizmoth));
        if (isAdd) {
            //如果成功，说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, swizzle, method_getImplementation(sysmoth), method_getTypeEncoding(sysmoth));
        }else{
            //否则，交换两个方法的实现
            method_exchangeImplementations(sysmoth, swizmoth);
        }
        
    });
}

-(void)swiz_viewWillAppear:(BOOL)animated{
    [self swiz_viewWillAppear:animated];
    NSLog(@"我是替换的（swiz_viewWillAppear）-runtime示例");
}
@end
