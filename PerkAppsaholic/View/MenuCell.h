//
//  MenuCell.h
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell

+ (NSString *)reuseIdentifier;

@property (nonatomic, strong) UILabel *title;

@end
