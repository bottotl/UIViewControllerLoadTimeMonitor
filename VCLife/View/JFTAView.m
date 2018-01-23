//
//  JFTAView.m
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "JFTAView.h"
#import "UIView+JFTVCLife.h"

@interface JFTAView()

@end

@implementation JFTAView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _view = [JFTBView new];
        _view.backgroundColor = [UIColor grayColor];
        [self addSubview:_view];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    NSLog(@"A layout");
}

@end
