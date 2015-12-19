//
//  SettingsView.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "SettingsView.h"
#import "AppConstants.h"
#import "Utilities.h"

@interface SettingsView ()

@property (nonatomic, strong) UILabel *lbl;

@end

@implementation SettingsView

- (id)init {
    self = [super init];
    
    if (self) {
        [self createViews];
    }
    
    return self;
}

- (void)createViews {
    
    self.backgroundColor = APP_THEME_COLOUR;
    
    self.lbl = [[UILabel alloc] init];
    self.lbl.text = @"Yes, we did it!";
    self.lbl.textAlignment = NSTextAlignmentCenter;
    self.lbl.textColor = UIAppThemeFontColor;
    self.lbl.numberOfLines = 0;
    self.lbl.font = [UIFont systemFontOfSize:24 weight:UIFontWeightHeavy];
    [self addSubview:self.lbl];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.lbl.frame = self.bounds;
}

@end
