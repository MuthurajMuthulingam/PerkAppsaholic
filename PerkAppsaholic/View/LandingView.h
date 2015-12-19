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
    kMenuSettings
}MenuStyle;

@protocol LandingViewDelegate <NSObject>

- (void)didSelectMenuWithType:(MenuStyle)menuStyle;

@end

@interface LandingView : UIView

@property (nonatomic, weak) id <LandingViewDelegate> delegate;

@end
