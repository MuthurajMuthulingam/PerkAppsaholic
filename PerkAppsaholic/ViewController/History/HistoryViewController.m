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
    self.view.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self segmentChangedToIndex:kHistoryUpcoming];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark HistoryViewDelegate Methods
- (void)segmentChangedToIndex:(HistoryType)historyType {
    NSLog(@"segement changed to index %d",historyType);
    
    [self.view.dataArray removeAllObjects];
    
    switch (historyType) {
        case kHistoryPast: {
            
            [self.view.dataArray addObjectsFromArray:@[@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About"]];
        }
            break;
        case kHistoryUpcoming: {
            [self.view.dataArray addObjectsFromArray:@[@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About"]];
        }
            break;
        case kHistoryCanceled: {
            [self.view.dataArray addObjectsFromArray:@[@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About"]];
        }
            break;
            
        default:
            break;
    }
    [self.view.tableView reloadData];
}

@end
