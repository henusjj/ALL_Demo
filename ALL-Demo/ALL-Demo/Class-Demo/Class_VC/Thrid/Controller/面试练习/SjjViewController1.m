//
//  SjjViewController1.m
//  ALL-Demo
//
//  Created by 史玉金 on 2018/10/15.
//  Copyright © 2018年 henusjj.com. All rights reserved.
//

#import "SjjViewController1.h"

@interface SjjViewController1 ()

@end

@implementation SjjViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *version1 = @"1.0.3a";
    NSString *version2 = @"1.0.7h";
    [self comarap:version1 andother:version2];
    
   
}

-(void)comarap:(NSString *)v1 andother:(NSString *)v2{
    int vnum1 = 0, vnum2 = 0;
//    const char *ch = [v1 cStringUsingEncoding:NSASCIIStringEncoding];
//    for (int i = 0; i < strlen(ch); i++) {
//        printf("%c", ch[i]);
//    }
    
    
    for (int i = 0; i < v1.length; i++) {
        int ascll = [v1 characterAtIndex:i];
//        数字0-9的ASCII码为：048到057
//        大写字母A-Z的ASCII为：065-090
//        小写字母a-z的ASCII为：097到122
        if (ascll>=48 && ascll <=57) {
            
        }
    }
    
//
//    //  loop untill both string are processed
//    for (int i=0,j=0; (i<v1.length || j<v2.length); )
//    {
//        NSArray  *array1 = [v1 componentsSeparatedByString:@"."];
//        NSArray  *array2 = [v2 componentsSeparatedByString:@"."];
//
//        //  storing numeric part of version 1 in vnum1
//        while (i < v1.length)
//        {
//            vnum1 = vnum1 * 10 ;
//            i++;
//        }
//
//        //  storing numeric part of version 2 in vnum2
//        while (j < v2.length)
//        {
//            vnum2 = vnum2 * 10 ;
//            j++;
//        }
//
//        if (vnum1 > vnum2){
//            NSLog(@"1");
//        }else{
//            NSLog(@"2");
//        }
//
//
//
//        //  if equal, reset variables and go for next numeric
//        // part
//        vnum1 = vnum2 = 0;
//        i++;
//        j++;
//
//        NSLog(@"%@  --   %@",array1,array2);
//    }
//
 
}
@end
