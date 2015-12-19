//
//  LoginToViewController.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "LoginToViewController.h"
#import "LoginView.h"

@interface LoginToViewController ()<LoginViewDelegate>

@property (nonatomic,strong) LoginView *loginView;

@end

@implementation LoginToViewController

- (void)createViews {
    [super createViews];
    self.view.backgroundColor = [UIColor greenColor];
    self.loginView = [[LoginView alloc] init];
    self.loginView.delegate = self;
    [self.view addSubview:self.loginView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Login View Delegate

- (void)loginView:(LoginView *)loginView userName:(NSString *)userName password:(NSString *)password {
    NSLog(@"Entered user Name : %@ and Password : %@",userName,password);
    
    [[AppsaholicSDK sharedManager] trackEvent:@"ba9c033948020fa049c93f57a216bcb0674e5a4a" withSubID:@"nil" notificationType:YES withController:self withSuccess:^(BOOL success, NSString *notificationtext, NSNumber *pointEarned) {
        NSLog(@"Achivement !!! Points Earned : %d,NotificationText %@",pointEarned.intValue,notificationtext);
    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.loginView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
