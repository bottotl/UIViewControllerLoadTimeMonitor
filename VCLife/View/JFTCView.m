//
//  JFTCView.m
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "JFTCView.h"
#import "UIView+JFTVCLife.h"

@implementation JFTCView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"C layout");
}

@end
