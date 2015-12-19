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
#import "Utilities.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LoginView ()<UITextFieldDelegate,FBSDKLoginButtonDelegate>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *lblOR;
@property (nonatomic, strong) FBSDKLoginButton *btnFB;

@property (nonatomic,strong) UIButton *loginBtn;




@property (nonatomic,strong) UIImageView *appImage;
@property (nonatomic,strong) UITextField *userName,*password;

@property (nonatomic, strong) UIView *separator1;

@property (nonatomic) BOOL isAnimating;


@end

@implementation LoginView

- (instancetype)init {
    
    if (self = [super init]) {
        [self createSubViews];
    }
    
    return self;
}

- (void)createSubViews {
    
    self.backgroundColor = APP_THEME_COLOUR;
    
    self.appImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bus"]];
    self.appImage.backgroundColor = [UIColor clearColor];
    [self addSubview:self.appImage];
    
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.cornerRadius = 4.0f;
    self.bgView.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.bgView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.bgView.layer.shadowRadius = 0.5;
    self.bgView.layer.shadowOpacity = .25;
    [self addSubview:self.bgView];
    
    self.lblOR = [[UILabel alloc] init];
    self.lblOR.text = @"Or";
    self.lblOR.textAlignment = NSTextAlignmentCenter;
    self.lblOR.textColor = UIAppThemeLightGreyColor;
    self.lblOR.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.lblOR];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = [UIColor whiteColor];
    [self.loginBtn.titleLabel setFont:[Utilities regularFontHeaderTwo]];
    [self.loginBtn setTitleColor:UIAppThemeFontColor forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:UIAppThemeFontColor forState:UIControlStateDisabled];
    [self.loginBtn setTitle:@"SIGN IN" forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 4.0f;
    self.loginBtn.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.loginBtn.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.loginBtn.layer.shadowRadius = 0.5;
    self.loginBtn.layer.shadowOpacity = .25;
    [self.loginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginBtn];
    
    
    self.btnFB = [[FBSDKLoginButton alloc] init];
    self.btnFB.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.btnFB.delegate = self;
//    [UIButton buttonWithType:UIButtonTypeCustom];
//    self.btnFB.backgroundColor = UIColorFromRGB(0x374d90);
//    [self.btnFB.titleLabel setFont:[Utilities regularFontHeaderTwo]];
//    [self.btnFB setTitleColor:UIAppThemeWhiteColor forState:UIControlStateNormal];
//    [self.btnFB setTitleColor:UIAppThemeWhiteColor forState:UIControlStateDisabled];
//    [self.btnFB setTitle:@"Login with Facebook" forState:UIControlStateNormal];
//    self.btnFB.layer.cornerRadius = 4.0f;
//    self.btnFB.layer.shadowOffset = CGSizeMake(0, 0.5);
//    self.btnFB.layer.shadowColor = [[UIColor blackColor] CGColor];
//    self.btnFB.layer.shadowRadius = 0.5;
//    self.btnFB.layer.shadowOpacity = .25;
//    [self.btnFB addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btnFB];
    
    
    self.userName = [[UITextField alloc] init];
    self.userName.backgroundColor = [UIColor whiteColor];
    self.userName.textAlignment = NSTextAlignmentLeft;
    self.userName.keyboardType = UIKeyboardTypeEmailAddress;
    self.userName.font = [Utilities regularFontofSize:16];
    self.userName.textColor = UIAppThemeFontColor;
    self.userName.delegate = self;
    self.userName.returnKeyType = UIReturnKeyNext;
    self.userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.userName.autocorrectionType = UITextAutocorrectionTypeNo;
    self.userName.spellCheckingType = UITextSpellCheckingTypeNo;
    self.userName.placeholder = @"Username";
    self.userName.layer.cornerRadius = 4.0f;
    self.userName.clipsToBounds = YES;
    self.userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userName.enablesReturnKeyAutomatically = YES;
    self.userName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: UIAppThemeLightGreyColor, NSFontAttributeName : [Utilities regularFontHeaderTwo]}];
    [self.bgView addSubview:self.userName];
    
    self.separator1 = [[UIView alloc] init];
    self.separator1.backgroundColor = UIAppThemeGreyColor;
    [self.bgView addSubview:self.separator1];
    
    self.password = [[UITextField alloc] init];
    self.password.backgroundColor = [UIColor whiteColor];
    self.password.textAlignment = NSTextAlignmentLeft;
    self.password.font = [Utilities regularFontofSize:16];
    self.password.textColor = UIAppThemeFontColor;
    self.password.secureTextEntry = YES;
    self.password.delegate = self;
    self.password.layer.cornerRadius = 4.0f;
    self.password.clipsToBounds = YES;
    self.password.returnKeyType = UIReturnKeyGo;
    self.password.enablesReturnKeyAutomatically = YES;
    self.password.placeholder = @"Password";
    self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.bgView addSubview:self.password];
    
    self.userName.text = @"user1";
    self.password.text = @"123456";
}

#pragma mark - FB Login

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    NSLog(@"FB Login Status %@",result);
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"FB Logout Status ");
}

#pragma mark - Login Event

- (void)loginClicked:(UIButton *)sender {
    
    self.isAnimating = YES;
    self.appImage.frame = CGRectMake((SCREEN_WIDTH/2)-75, 70, 150, 100);
    
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.appImage.frame = CGRectMake(SCREEN_WIDTH, 50, 100, 70);
                     }
                     completion:^(BOOL finished){
                         self.isAnimating = NO;
                         [self.delegate loginView:self userName:self.userName.text password:self.password.text];
                     }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    if (!self.isAnimating) {
//        self.appImage.frame = CGRectMake((CGRectGetWidth(self.frame)/2)-75, 70, 150, 100);
//    }
    
    self.bgView.frame = CGRectMake(10, CGRectGetMaxY(self.appImage.frame)+20, SCREEN_WIDTH-20, 100);
    
    CGFloat buttonHeight = 54.0f;
    self.loginBtn.frame = CGRectMake(10, CGRectGetMaxY(self.bgView.frame)+10, CGRectGetWidth(self.bounds)-20, buttonHeight);
    
    self.lblOR.frame = CGRectMake(10, CGRectGetMaxY(self.loginBtn.frame)+10, CGRectGetWidth(self.bounds)-20, 20);
    
    self.btnFB.frame = CGRectMake(10, CGRectGetMaxY(self.lblOR.frame)+10, CGRectGetWidth(self.bounds)-20, buttonHeight);
    
    self.userName.frame = CGRectMake(20, 0 , CGRectGetWidth(self.bgView.frame)-40, 50);
    self.separator1.frame = CGRectMake(20, CGRectGetMaxY(self.userName.frame), CGRectGetWidth(self.bgView.frame)-20, 1);
    self.password.frame = CGRectMake(20, CGRectGetMaxY(self.separator1.frame), CGRectGetWidth(self.bgView.frame)-20, 49);
}

- (void)animateBus {
    
    self.isAnimating = YES;
    self.appImage.frame = CGRectMake(-100, 50, 100, 70);
    
    
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.appImage.frame = CGRectMake((SCREEN_WIDTH/2)-75, 70, 150, 100);
                     }
                     completion:^(BOOL finished){
                         self.isAnimating = NO;
                     }];
    
}

@end
