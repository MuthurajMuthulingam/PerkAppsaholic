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

@interface LandingViewController ()<LandingViewDelegate,planViewControllerDelegate>

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
    
    [self didSelectMenuWithType:kMenuPlan];
    
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
    
    switch (menuStyle) {
        case kMenuHistory: {
            
            if (self.childController) {
                [self.childController.view removeFromSuperview];
                self.childController = nil;
            }
            
            HistoryViewController *historyController = [[HistoryViewController alloc] init];
            [self.view addSubview:historyController.view];
            historyController.view.frame = CGRectMake(0, 75, SCREEN_WIDTH, SCREEN_HEIGHT-75);
            self.childController = historyController;
            
        }
            break;
        case kMenuPlan: {
            
            if (self.childController) {
                [self.childController.view removeFromSuperview];
                self.childController = nil;
            }
            
            PlanViewController *planController = [[PlanViewController alloc] init];
            [self.view addSubview:planController.view];
            planController.delegate = self;
            planController.view.frame = CGRectMake(0, 75, SCREEN_WIDTH, SCREEN_HEIGHT-75);
            self.childController = planController;
            
        }
            break;
        case kMenuSettings: {
            [[AppsaholicSDK sharedManager] showPortal];
            
        }
            break;
        case kMenuAbout: {
            SettingsViewController *settingsController = [[SettingsViewController alloc] init];
            [self.view addSubview:settingsController.view];
            settingsController.view.frame = CGRectMake(0, 75, SCREEN_WIDTH, SCREEN_HEIGHT-75);
            self.childController = settingsController;
            
        }
            break;
            
        default:
            break;
    }
    
    [self showingMenu:YES];
}

- (void)showingMenu:(BOOL)flag {
    
    self.childController.view.userInteractionEnabled = flag;
}

#pragma mark planViewControllerDelegate Metjhods

- (void)addPoints {
    [[AppsaholicSDK sharedManager] trackEvent:@"d989f7d005b3701b1ca170f4e3382ceaaee05dc6" withSubID:@"nil" notificationType:NO withController:self withSuccess:^(BOOL success, NSString *notificationtext, NSNumber *pointEarned) {
        NSLog(@"Achivement !!! Points Earned : %d,NotificationText %@",pointEarned.intValue,notificationtext);
    }];

}

@end
