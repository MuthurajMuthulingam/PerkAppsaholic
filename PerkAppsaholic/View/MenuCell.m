//
//  MenuCell.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "MenuCell.h"
#import "AppConstants.h"
#import "Utilities.h"

@implementation MenuCell


+ (NSString *)reuseIdentifier {
    
    return @"MenuCell";
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createViews];
    }
    return self;
}

- (void)createViews {
    
    self.backgroundColor = [UIColor clearColor];
    
    self.title = [[UILabel alloc] init];
    self.title.textAlignment = NSTextAlignmentLeft;
    self.title.textColor = [UIColor whiteColor];
    self.title.font = [Utilities regularFontHeaderTwo];
    self.title.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [self addSubview:self.title];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.title.frame = CGRectMake(20, 0, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame));
}

@end
