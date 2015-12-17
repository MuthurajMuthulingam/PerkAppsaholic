//
//  BaseView.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "BaseView.h"
#import "MenuView.h"
#import "HeaderView.h"

@interface BaseView ()<HeaderViewDelegate>
{
    float mainContentXPos;
    BOOL menuShowing;
}

@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) MenuView *menu;
@property (nonatomic,strong) UIView *baseContainerView;

@end

@implementation BaseView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews {
    mainContentXPos = 0;
    menuShowing = NO;
    
    self.menuView = [[UIView alloc] init];
    self.menuView.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.menuView];
    
    self.baseContainerView = [[UIView alloc] init];
    self.baseContainerView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.baseContainerView];
    
    self.menu = [[MenuView alloc] init];
    [self.menuView addSubview:self.menu];
    
    self.headerView = [[HeaderView alloc] init];
    self.headerView.delegate = self;
    [self.baseContainerView addSubview:self.headerView];
    
    self.mainContentView = [[UIView alloc] init];
    self.mainContentView.backgroundColor = [UIColor redColor];
    [self.baseContainerView addSubview:self.mainContentView];

}

#pragma mark - Header View Delegate

- (void)headerView:(HeaderView *)headerView menuClicked:(BOOL)clicked {
    [self showMenu:!menuShowing];
    menuShowing = !menuShowing;
}

- (void)showMenu:(BOOL)show {
    
    if (show) {
        mainContentXPos = self.frame.size.width * 0.8;
    } else {
        mainContentXPos = 0;
    }
    
    [UIView animateWithDuration:5.0 animations:^{
        [self setNeedsLayout];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    float startXPos = 0;
    float startYPos = 20;
    float fullWidth = self.frame.size.width - (startXPos);
    float fullHeight = self.frame.size.height - (startYPos);
    
    self.menuView.frame = CGRectMake(startXPos, startYPos, fullWidth, fullHeight);
    self.menu.frame = CGRectMake(0, 0, self.menuView.frame.size.width, self.menuView.frame.size.height);
    
    self.baseContainerView.frame = CGRectMake(mainContentXPos, startYPos, fullWidth, fullHeight);
    
    startXPos = 0;
    startYPos = 0;
    fullWidth = self.baseContainerView.frame.size.width - startXPos;
    fullHeight = self.baseContainerView.frame.size.height - startYPos;
    
    self.headerView.frame = CGRectMake(startXPos, startYPos, fullWidth, 50);
    self.mainContentView.frame = CGRectMake(startXPos, self.headerView.frame.origin.y + self.headerView.frame.size.height, fullWidth, fullHeight);
}

@end
