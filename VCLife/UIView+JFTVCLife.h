//
//  UIView+JFTVCLife.h
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface JFWeakWarraper : NSObject
@property (nonatomic, weak) UIViewController *vc;
- (instancetype)initWithVC:(UIViewController *)vc;
@end

@interface UIView (JFTVCLife)
@property (nonatomic, strong) JFWeakWarraper *jftVCRef;
- (void)prepareVCLifeRecord;
- (void)recordVCLife;

- (void)jft_layoutSublayersOfLayer:(CALayer *)layer;
@end
