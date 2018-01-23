//
//  ViewController.m
//  VCLife
//
//  Created by syfll on 2018/1/23.
//  Copyright © 2018年 syfll. All rights reserved.
//

#import "ViewController.h"
#import "JFTAView.h"
#import "JFTCView.h"

@interface ViewController ()
@property (nonatomic, strong) JFTAView *aView;
@property (nonatomic, strong) JFTCView *cView;
@property (nonatomic, assign) CFTimeInterval start;
@property (nonatomic, assign) CFTimeInterval end;
@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void)viewDidLoad {
    self.start = CACurrentMediaTime();
    NSLog(@"start %f", self.start);
    [super viewDidLoad];
    self.aView = [JFTAView new];
    [self.view addSubview:self.aView];
    self.cView = [JFTCView new];
    [self.view addSubview:self.cView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    NSLog(@"%@", NSStringFromSelector(_cmd));
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"reload");
        [self.tableView reloadData];
    });
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.aView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 2);
    self.cView.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) / 2, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 2);
}

- (void)viewDidLayoutSubviews {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.end = CACurrentMediaTime();
    NSLog(@"duration %f", self.end - self.start);
}

- (void)dealloc {
}

@end
