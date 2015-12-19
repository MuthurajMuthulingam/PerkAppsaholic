//
//  BaseViewController.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <iOSStandardTasks/iOSStandardTasks.h>
#import "BaseViewController.h"
#import "BaseView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)loadView {
    
    [self createViews];
    
}


- (void)createViews {
    
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [[AppsaholicSDK sharedManager] startSession:@"a6baa7402d43fea95c1df341dd66567e78902732" withSuccess:^(BOOL success, NSString *status) {
        NSLog(@"App ready to use Perk SDK Status : %@",status);
    }];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(menuClicked:)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // Do any additional setup after loading the view.
    
    ((AppsaholicSDK *)[AppsaholicSDK sharedManager]).appsaholic_rootViewController = self;
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)menuClicked:(UIBarButtonItem *)sender {
    NSLog(@"Menu Clicked");
    if ([self.view subviews].count > 0) {
        [((BaseView *)[[self.view subviews] objectAtIndex:0]) showMenu:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
