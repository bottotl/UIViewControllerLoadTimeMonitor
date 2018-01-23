//
//  JFTVCLoadCenter.h
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFTVCLoadCenter : NSObject
+ (instancetype)defaultCenter;
- (void)postVCStartLayoutNotification:(UIViewController *)vc;
- (void)postVCEndLayouttNotification:(UIViewController *)vc;
@end
