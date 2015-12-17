//
//  HeaderView.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/17/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HeaderView.h"
#import "UIButton+MyButton.h"

@interface HeaderView ()

@property (nonatomic,strong) UIButton *menuBtn;
@property (nonatomic,strong) UIButton *backButton;

@end

@implementation HeaderView

- (instancetype)init {
    if (self = [super init]) {
        [self createViews];
    }
    return self;
}

- (void)createViews {
    
    self.backgroundColor = [UIColor purpleColor];
    
    self.menuBtn = [[UIButton alloc] initWithFrame:CGRectZero andTitleText:@"Menu" titleColor:[UIColor whiteColor] image:nil selectedImage:nil];
    [self.menuBtn addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.menuBtn];
    
    self.backButton = [[UIButton alloc] initWithFrame:CGRectZero andTitleText:@"Menu" titleColor:[UIColor whiteColor] image:nil selectedImage:nil];
    [self.backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.menuBtn];
}

- (void)menuClicked:(UIButton *)sender {
    [self.delegate headerView:self menuClicked:YES];
}

- (void)backClicked:(UIButton *)sender {
    [self.delegate headerView:self menuClicked:YES];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    float startXPos = 10;
    float startYPos = 5;
    float fullWidth = self.frame.size.width - (startXPos);
    float fullHeight = self.frame.size.height - (startYPos);
    
    self.menuBtn.frame = CGRectMake(startXPos, startYPos, 50, 40);
    
}

@end
