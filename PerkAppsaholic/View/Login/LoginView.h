//
//  LoginView.h
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

@class LoginView;

@protocol LoginViewDelegate <NSObject>

- (void)loginView:(LoginView *)loginView userName:(NSString *)userName password:(NSString *)password;

@end

@interface LoginView : UIView

@property (nonatomic,weak)id<LoginViewDelegate>delegate;

- (void)animateBus;
- (void)completeAnimation;

@end
