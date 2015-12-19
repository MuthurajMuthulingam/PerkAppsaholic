//
//  PlanView.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "PlanView.h"
#import "AppConstants.h"
#import "Utilities.h"

@interface PlanView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *viewOne;
@property (nonatomic, strong) UIView *viewTwo;

@end

@implementation PlanView

- (id)init {
    self = [super init];
    
    if (self) {
        [self createViews];
    }
    
    return self;
}

- (void)createViews {
    
    self.backgroundColor = APP_THEME_COLOUR;
    
    self.viewOne = [[UIView alloc] init];
    self.viewOne.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.viewOne];
    
    self.viewTwo = [[UIView alloc] init];
    self.viewTwo.backgroundColor = [UIColor brownColor];
    [self addSubview:self.viewTwo];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.viewOne.frame = CGRectMake(30, 100, SCREEN_WIDTH-60, 50);
    self.viewTwo.frame = CGRectMake(30, 180, SCREEN_WIDTH-60, 50);
}

@end
