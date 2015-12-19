//
//  PlanViewController.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "PlanViewController.h"
#import "PlanView.h"

@interface PlanViewController ()

@property (nonatomic, strong) PlanView *view;

@end

@implementation PlanViewController

- (void)loadView {
    [super loadView];
    
    self.view = [[PlanView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
