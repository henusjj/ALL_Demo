//
//  AppDelegate.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/5/6.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "AppDelegate.h"
#import "SjjBaseControllerViewViewController.h"
#import "Sjj-MainTabBarControllerConfig.h"
#import "SjjNavigationController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate{
    AppDelegate *object;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    Sjj_MainTabBarControllerConfig *mainconfig=[[Sjj_MainTabBarControllerConfig alloc]init];
    self.window.rootViewController=mainconfig.mainTabbarVC;
    [self.window makeKeyAndVisible];
    

    return YES;
}
//-(void) createWindow {
//    
//    //    第三 使用MMDrawerController
//    SjjRightVC *r=[[SjjRightVC alloc]init];
////    SjjCenterVC *c=[[SjjCenterVC alloc]init];
//    SjjLeftVC *l=[[SjjLeftVC alloc]init];
//    
//    SjjInfoViewLeft *main=[[SjjInfoViewLeft alloc]init];//相当于Center
//    
//    object.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
//    object.window.backgroundColor = [UIColor whiteColor];
//    object.drawerController=[[MMDrawerController alloc]initWithCenterViewController:main leftDrawerViewController:l];
//    [object.drawerController setShowsShadow:NO];//设置是否有阴影
//    [object.drawerController setShouldStretchDrawer:NO];//设置是否回弹效果
//    //5、设置左右两边抽屉显示的多少
//    [object.drawerController setMaximumLeftDrawerWidth:ScreenWidth-100];//最大距离
//    //4、设置打开/关闭抽屉的手势
//    [object.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
//    [object.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
//    
//    [object.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//        
//    }];
//    object.window.rootViewController = object.drawerController;
//    [object.window makeKeyWindow];
//    
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
