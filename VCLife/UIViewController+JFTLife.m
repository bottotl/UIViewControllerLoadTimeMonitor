//
//  UIViewController+JFTLife.m
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "UIViewController+JFTLife.h"
#import "UIView+JFTVCLife.h"

@implementation UIViewController (JFTLife)

- (void)jft_setView:(UIView *)view {
    JFWeakWarraper *weakWapper = [[JFWeakWarraper alloc] initWithVC:self];
    view.jftVCRef = weakWapper;
    [self jft_setView:view];
}

- (void)jft_viewWillLayoutSubviews {
    [self.view prepareVCLifeRecord];
    [self jft_viewWillLayoutSubviews];
}

- (void)jft_viewDidLayoutSubviews {
    [self.view recordVCLife];
    [self jft_viewDidLayoutSubviews];
}

@end
