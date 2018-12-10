//
//  GCD-ViewController.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/8/28.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "GCD-ViewController.h"

@interface GCD_ViewController ()

@end

@implementation GCD_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GCD的使用";
//    GCD 的使用步骤其实很简单，只有两步。
//
//    创建一个队列（串行队列或并发队列）
//    将任务追加到任务的等待队列中，然后系统就会根据任务类型执行任务（同步执行或异步执行）

    
    [self syncConcurrent];
    
    
}

#pragma mark ============ 队列的创建方法/获取方法 ============

/**
 
 可以使用dispatch_queue_create来创建队列，需要传入两个参数，第一个参数表示队列的唯一标识符，用于 DEBUG，可为空，Dispatch Queue 的名称推荐使用应用程序 ID 这种逆序全程域名；第二个参数用来识别是串行队列还是并发队列。DISPATCH_QUEUE_SERIAL 表示串行队列，DISPATCH_QUEUE_CONCURRENT 表示并发队列。
 

 */
-(void)creatQueue{
//    串行队列
    dispatch_queue_t queue1 = dispatch_queue_create("one", DISPATCH_QUEUE_SERIAL);
    
//    并行队列
    dispatch_queue_t queue2 = dispatch_queue_create("two", DISPATCH_QUEUE_CONCURRENT);
    
//    获取主队列方法---串行队列中的一种特殊
    
    dispatch_queue_t queue3 = dispatch_get_main_queue();
    
    
    /**
     对于并发队列，GCD 默认提供了全局并发队列（Global Dispatch Queue）。
     可以使用dispatch_get_global_queue来获取。需要传入两个参数。第一个参数表示队列优先级，一般用DISPATCH_QUEUE_PRIORITY_DEFAULT。第二个参数暂时没用，用0即可。
     
     */
    dispatch_queue_t queue4 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);


#pragma mark ============ 任务的创建方法 ============


//    GCD 提供了同步执行任务的创建方法dispatch_sync和异步执行任务创建方法dispatch_async。
    
    //同步
    dispatch_sync(queue1, ^{
    //        这里写执行的代码
    });
    
//    异步
    dispatch_async(queue2, ^{
//          这里写执行的代码
    });
    
    
    
#pragma mark ============ 两种任务方式（同步异步） 两种队列（串行并行） 组合 ============
//    虽然使用 GCD 只需两步，但是既然我们有两种队列（串行队列/并发队列），两种任务执行方式（同步执行/异步执行），那么我们就有了四种不同的组合方式。这四种不同的组合方式是：
//
//    同步执行 + 并发队列
//    异步执行 + 并发队列
//    同步执行 + 串行队列
//    异步执行 + 串行队列

//    实际上，刚才还说了两种特殊队列：全局并发队列、主队列。全局并发队列可以作为普通并发队列来使用。但是主队列因为有点特殊，所以我们就又多了两种组合方式。这样就有六种不同的组合方式了。
//
//    同步执行 + 主队列
//    异步执行 + 主队列
}


/**
 * 同步执行 + 并发队列
 * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
 */
- (void)syncConcurrent {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"syncConcurrent---end");
}


#pragma mark ============ GCD一次代码（常用可以是单例） ============

-(void)once{
    static dispatch_once_t onceToncke;
    dispatch_once(onceToncke, ^{
//        执行一次性的代码（这里默认是线程安全）
        
    });
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
