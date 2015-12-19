//
//  HeaderView.h
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/17/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

@class HeaderView;

@protocol HeaderViewDelegate <NSObject>

- (void)headerView:(HeaderView *)headerView menuClicked:(BOOL)clicked;
- (void)headerView:(HeaderView *)headerView backButtonClicked:(BOOL)clicked;

@end


@interface HeaderView : UIView

@property (nonatomic,weak) id<HeaderViewDelegate>delegate;
- (void)showMenuButton:(BOOL)show;

@end
