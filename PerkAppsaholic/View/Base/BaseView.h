//
//  BaseView.h
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

@interface BaseView : UIView

@property (nonatomic,strong) UIView *menuView;
@property (nonatomic,strong) UIView *mainContentView;

- (void)createSubViews;
- (void)showMenu:(BOOL)show;

@end
