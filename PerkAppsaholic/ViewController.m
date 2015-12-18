//
//  ViewController.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <AppsaholicSDK/AppsaholicSDK.h>
#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@property (nonatomic,strong) MyView *myView;

@end

@implementation ViewController

- (void)createViews {
    [super createViews];
    self.view.backgroundColor = [UIColor greenColor];
    self.myView = [[MyView alloc] init];
    [self.view addSubview:self.myView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ((AppsaholicSDK *)[AppsaholicSDK sharedManager]).appsaholic_rootViewController  = self;

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.myView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
