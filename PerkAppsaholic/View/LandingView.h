//
//  LandingView.h
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "BaseView.h"

typedef enum {
    kMenuHistory,
    kMenuPlan,
    kMenuSettings,
    kMenuAbout
}MenuStyle;

@protocol LandingViewDelegate <NSObject>

- (void)didSelectMenuWithType:(MenuStyle)menuStyle;
- (void)showingMenu:(BOOL)flag;

@end

@interface LandingView : UIView

@property (nonatomic, strong) UILabel *lblPerks;

@property (nonatomic, weak) id <LandingViewDelegate> delegate;

@end
