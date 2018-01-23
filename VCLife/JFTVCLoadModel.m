//
//  JFTVCLoadModel.m
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "JFTVCLoadModel.h"

@implementation JFTVCLoadModel

- (instancetype)init {
    if (self = [super init]) {
        self.startTime = 0;
        self.endTime = 0;
        self.stable = NO;
    }
    return self;
}

@end
