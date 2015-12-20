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

#import "HistoryViewController.h"
#import "PlanViewController.h"
#import "SettingsViewController.h"
#import "AppConstants.h"
#import "Utilities.h"

@interface LandingViewController ()<LandingViewDelegate>

@property (nonatomic,strong) LandingView *view;
@property (nonatomic, strong) UIViewController *childController;

@end

@implementation LandingViewController

@dynamic view;

- (void)createViews {
    [super createViews];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.view = [[LandingView alloc] init];
    self.view.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self didSelectMenuWithType:kMenuHistory];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    ((AppsaholicSDK *)[AppsaholicSDK sharedManager]).appsaholic_rootViewController  = self;

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.view.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark LandingViewDelegate Methods

- (void)didSelectMenuWithType:(MenuStyle)menuStyle {
    
    if (self.childController) {
        [self.childController.view removeFromSuperview];
        self.childController = nil;
    }
    
    switch (menuStyle) {
        case kMenuHistory: {
            
            HistoryViewController *historyController = [[HistoryViewController alloc] init];
            [self.view addSubview:historyController.view];
            historyController.view.frame = CGRectMake(0, 75, SCREEN_WIDTH, SCREEN_HEIGHT-75);
            self.childController = historyController;
            
        }
            break;
        case kMenuPlan: {
            
            PlanViewController *planController = [[PlanViewController alloc] init];
            [self.view addSubview:planController.view];
            planController.view.frame = CGRectMake(0, 75, SCREEN_WIDTH, SCREEN_HEIGHT-75);
            self.childController = planController;
            
        }
            break;
        case kMenuSettings: {
            
//            SettingsViewController *settingsController = [[SettingsViewController alloc] init];
//            [self.view addSubview:settingsController.view];
//            settingsController.view.frame = CGRectMake(0, 75, SCREEN_WIDTH, SCREEN_HEIGHT-75);
//            self.childController = settingsController;
            
            //((AppsaholicSDK *)[AppsaholicSDK sharedManager]).appsaholic_rootViewController = self;
            [[AppsaholicSDK sharedManager] showPortal];
            
        }
            break;
            
        default:
            break;
    }
    
}

@end
