//
//  HistoryViewController.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryView.h"

@interface HistoryViewController ()

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
