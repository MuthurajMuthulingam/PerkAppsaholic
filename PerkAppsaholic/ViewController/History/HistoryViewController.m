//
//  HistoryViewController.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryView.h"

@interface HistoryViewController ()<HistoryViewDelegate>

@property (nonatomic, strong) HistoryView *view;

@end

@implementation HistoryViewController

@dynamic view;

- (void)loadView {
    [super loadView];
    
    self.view = [[HistoryView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.dataArray removeAllObjects];
    [self.view.dataArray addObjectsFromArray:@[@"History", @"Plan New Journey", @"Settings"]];
    [self.view.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark HistoryViewDelegate Methods
- (void)segmentChangedToIndex:(HistoryType)historyType {
    NSLog(@"segement changed to index %d",historyType);
}

@end
