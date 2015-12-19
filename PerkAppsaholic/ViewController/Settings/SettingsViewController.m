//
//  SettingsViewController.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsView.h"

@interface SettingsViewController ()

@property (nonatomic, strong) SettingsView *view;

@end

@implementation SettingsViewController

- (void)loadView {
    [super loadView];
    
    self.view = [[SettingsView alloc] init];
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
