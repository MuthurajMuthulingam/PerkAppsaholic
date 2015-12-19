//
//  ViewController.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <AppsaholicSDK/AppsaholicSDK.h>
#import "LandingViewController.h"
#import "LandingView.h"

@interface LandingViewController ()

@property (nonatomic,strong) LandingView *view;

@end

@implementation LandingViewController

@dynamic view;

- (void)createViews {
    [super createViews];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.view = [[LandingView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    ((AppsaholicSDK *)[AppsaholicSDK sharedManager]).appsaholic_rootViewController  = self;

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.view.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
