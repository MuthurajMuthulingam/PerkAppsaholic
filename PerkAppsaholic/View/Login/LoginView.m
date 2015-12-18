//
//  LoginView.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "LoginView.h"
#import "UITextField+MyTextField.h"
#import "UIButton+MyButton.h"
#import "AppConstants.h"

@interface LoginView ()

@property (nonatomic,strong) UIImageView *appImage;
@property (nonatomic,strong) UITextField *userName,*password;
@property (nonatomic,strong) UIButton *loginBtn;

@end

@implementation LoginView

- (instancetype)init {
    if (self = [super init]) {
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews {
    self.appImage = [[UIImageView alloc] init];
    self.appImage.backgroundColor = [UIColor grayColor];
    [self addSubview:self.appImage];
    
    self.userName = [[UITextField alloc] initWithFrame:CGRectZero andText:@"UserName" font:[UIFont fontWithName:FontName size:19.0] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
    self.userName.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.userName];
    
    self.password = [[UITextField alloc] initWithFrame:CGRectZero andText:@"Password" font:[UIFont fontWithName:FontName size:19.0] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
    self.password.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.password];
    
    self.loginBtn = [[UIButton alloc] initWithFrame:CGRectZero andTitleText:@"Login" titleColor:[UIColor blackColor] image:nil selectedImage:nil];
    [self.loginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginBtn];
}

#pragma mark - Login Event

- (void)loginClicked:(UIButton *)sender {
    [self.delegate loginView:self userName:self.userName.text password:self.password.text];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    float startXPos = self.frame.size.width / 4;
    float startYPos = self.frame.size.height / 4;
    float fullWidth = self.frame.size.width - (startXPos*2);
    float fullHeight = self.frame.size.height - (startYPos + 8);
    
    self.appImage.frame = CGRectMake(startXPos, startYPos, 100, 100);
    self.userName.frame = CGRectMake(startXPos, self.appImage.frame.size.height + self.appImage.frame.origin.y+2, fullWidth, 40);
    self.password.frame = CGRectMake(startXPos, self.userName.frame.size.height + self.userName.frame.origin.y+2, fullWidth, 40);
    self.loginBtn.frame = CGRectMake(startXPos, self.password.frame.size.height + self.password.frame.origin.y+ 4, fullWidth, 100);
}

@end
