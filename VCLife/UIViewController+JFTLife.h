//
//  UIViewController+JFTLife.h
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JFTLife)

- (void)jft_setView:(UIView *)view;

- (void)jft_viewWillLayoutSubviews;
- (void)jft_viewDidLayoutSubviews;

@end
