//
//  JFTVCLoadCenter.m
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "JFTVCLoadCenter.h"
#import "JFTVCLoadModel.h"

static JFTVCLoadCenter * _defaultCenter;

@interface JFTVCLoadCenter ()
@property (nonatomic, strong) NSMutableDictionary *vcBlockCache;
@property (nonatomic, strong) NSMutableDictionary *vcLoadModelCache;

@end

@implementation JFTVCLoadCenter

+ (instancetype)defaultCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultCenter = [[JFTVCLoadCenter alloc] init];
    });
    return _defaultCenter;
}

- (instancetype)init {
    if (self = [super init]) {
        _vcBlockCache = @{}.mutableCopy;
        _vcLoadModelCache = @{}.mutableCopy;
    }
    return self;
}

- (void)postVCStartLayoutNotification:(UIViewController *)vc {
    NSString *p = [NSString stringWithFormat:@"%p", vc];
    [self addStartTimeIfNeed:p];
    dispatch_block_t calculateBlock = self.vcBlockCache[p];
    if (calculateBlock) {
        dispatch_block_cancel(calculateBlock);
        NSLog(@"cancle block %p", calculateBlock);
        _vcBlockCache[p] = nil;
    }
}

- (void)postVCEndLayouttNotification:(UIViewController *)vc {
    NSString *p = [NSString stringWithFormat:@"%p", vc];
    [self updateEndTimeIfNeed:p];
    dispatch_block_t calculateBlock = self.vcBlockCache[p];
    if (calculateBlock) {
        dispatch_block_cancel(calculateBlock);
        NSLog(@"cancle block %p", calculateBlock);
        _vcBlockCache[p] = nil;
    }
    
    calculateBlock = dispatch_block_create(0, ^{
        JFTVCLoadModel *model = self.vcLoadModelCache[p];
        model.stable = YES;
        NSLog(@"vc end load");
        NSLog(@"vc load time:%f", (model.endTime - model.startTime));
    });
    self.vcBlockCache[p] = calculateBlock;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), calculateBlock);
}

- (void)addStartTimeIfNeed:(NSString *)p {
    JFTVCLoadModel *model = self.vcLoadModelCache[p];
    if (!model) {
        model = [JFTVCLoadModel new];
        self.vcLoadModelCache[p] = model;
    }
    if (model.startTime == 0) {/// need update
        model.startTime = CACurrentMediaTime();
    }
}

- (void)updateEndTimeIfNeed:(NSString *)p {
    JFTVCLoadModel *model = self.vcLoadModelCache[p];
    NSAssert(model, @"结束必须比开始先执行");
    if (model.stable) {
        NSLog(@"vc have stable, no need to update end time");
    } else {
        model.endTime = CACurrentMediaTime();
    }
}

@end
