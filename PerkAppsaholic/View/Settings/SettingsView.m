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
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UITextView *txtView;
@property (nonatomic, strong) UILabel *lblStar;

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
    
    self.img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"team"]];
    [self addSubview:self.img];
    
    self.lbl = [[UILabel alloc] init];
    self.lbl.text = @"Yes, we did it!";
    self.lbl.textAlignment = NSTextAlignmentCenter;
    self.lbl.textColor = UIAppThemeFontColor;
    self.lbl.numberOfLines = 0;
    self.lbl.font = [UIFont systemFontOfSize:24 weight:UIFontWeightHeavy];
    [self addSubview:self.lbl];
    
    self.txtView = [[UITextView alloc] init];
    self.txtView.text = @"We are \n\nChandrachudh.K\n\nElamvazhuthi.K\n\nMuthuraj.M";
    self.txtView.textAlignment = NSTextAlignmentCenter;
    self.txtView.textColor = UIAppThemeFontColor;
    self.txtView.backgroundColor = [UIColor clearColor];
    self.txtView.userInteractionEnabled = NO;
    [self addSubview:self.txtView];
    
    self.lblStar = [[UILabel alloc] init];
    self.lblStar.text = @"This is prototype application. Not for sale!";
    self.lblStar.textAlignment = NSTextAlignmentCenter;
    self.lblStar.textColor = UIColorFromRGB(0x000000);
    self.lblStar.font = [Utilities regularFontofSize:10];
    [self addSubview:self.lblStar];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.img.frame = CGRectMake(0, 0, SCREEN_WIDTH, 250);
    self.lbl.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.txtView.frame = CGRectMake(0, 320, SCREEN_WIDTH, 150);
    self.lblStar.frame = CGRectMake(0, SCREEN_HEIGHT-(30+75), SCREEN_WIDTH, 30);
}

@end
