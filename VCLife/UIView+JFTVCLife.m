//
//  UIView+JFTVCLife.m
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "UIView+JFTVCLife.h"
#import <objc/runtime.h>
#import "JFTVCLoadCenter.h"

@implementation JFWeakWarraper
- (instancetype)initWithVC:(UIViewController *)vc {
    if (self = [super init]) {
        _vc = vc;
    }
    return self;
}
@end

static const void *JFTVCRefKey = &JFTVCRefKey;

@implementation UIView (JFTVCLife)

- (void)setJftVCRef:(JFWeakWarraper *)vcRef {
    if (!vcRef) {
        return;
    }
    objc_setAssociatedObject(self, JFTVCRefKey, vcRef, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JFWeakWarraper *)jftVCRef {
    return objc_getAssociatedObject(self, JFTVCRefKey);
}

- (void)prepareVCLifeRecord {
    UIViewController *vc = self.jftVCRef.vc;
    if (!vc) return;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.jftVCRef = [[JFWeakWarraper alloc] initWithVC:vc];
    }];
    [[JFTVCLoadCenter defaultCenter] postVCStartLayoutNotification:vc];
}

- (void)recordVCLife {
    UIViewController *vc = self.jftVCRef.vc;
    if (!vc) return;
    [[JFTVCLoadCenter defaultCenter] postVCEndLayouttNotification:vc];
}


- (void)jft_layoutSublayersOfLayer:(CALayer *)layer {
    [self prepareVCLifeRecord];
    [self jft_layoutSublayersOfLayer:layer];
    [self recordVCLife];
}

@end
