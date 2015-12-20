//
//  LoginToViewController.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

#import "LoginToViewController.h"
#import "LoginView.h"
#import "LandingViewController.h"

@interface LoginToViewController ()<LoginViewDelegate>

@property (nonatomic,strong) LoginView *view;

@end

@implementation LoginToViewController

@dynamic view;

- (void)createViews {
    
    [super createViews];
    
    self.view = [[LoginView alloc] init];
    self.view.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view animateBus];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        // User is logged in, do work such as go to next view controller.
        NSLog(@"User is Already Login...");
        
        //LandingViewController *ctrl = [LandingViewController new];
        //[self.navigationController pushViewController:ctrl animated:YES];
    }
}

#pragma mark - Login View Delegate

- (void)loginView:(LoginView *)loginView userName:(NSString *)userName password:(NSString *)password {
    NSLog(@"Entered user Name : %@ and Password : %@",userName,password);
    
//    [[AppsaholicSDK sharedManager] trackEvent:@"ba9c033948020fa049c93f57a216bcb0674e5a4a" withSubID:@"nil" notificationType:NO withController:self withSuccess:^(BOOL success, NSString *notificationtext, NSNumber *pointEarned) {
//        NSLog(@"Achivement !!! Points Earned : %d,NotificationText %@",pointEarned.intValue,notificationtext);
//    }];
    
//    LandingViewController *ctrl = [LandingViewController new];
//    [self.navigationController pushViewController:ctrl animated:YES];
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"http://www.google.com"];
    content.contentDescription = @"Perk Appsaholic Testing...";
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
