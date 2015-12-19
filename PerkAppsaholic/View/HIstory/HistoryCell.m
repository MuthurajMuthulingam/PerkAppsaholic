//
//  HistoryCell.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HistoryCell.h"
#import "AppConstants.h"
#import "Utilities.h"

@interface HistoryCell ()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIView *separator;
@property (nonatomic, strong) UILabel *lblFromTo;
@property (nonatomic, strong) UILabel *lblTime;
@property (nonatomic, strong) UILabel *lblName;
@property (nonatomic, strong) UIImageView *imgCalender;
@property (nonatomic, strong) UILabel *lblDate;
@property (nonatomic, strong) UILabel *lblYear;
@property (nonatomic, strong) UIImageView *imgPerk;
@property (nonatomic, strong) UILabel *lblPerkPoints;

@property (nonatomic, strong) UIView *calView1;
@property (nonatomic, strong) UIView *calView2;
@property (nonatomic, strong) UIView *calView3;

@end

@implementation HistoryCell

+ (NSString *)reuseIdentifier {
    
    return @"HistoryCell";
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
    
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.bgView = [UIView new];
    [self.bgView setBackgroundColor:UIAppThemeWhiteColor];
    self.bgView.layer.cornerRadius = 4.0f;
    self.bgView.clipsToBounds = YES;
    [self.contentView addSubview:self.bgView];
    
    
    self.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowRadius = 0.5;
    self.layer.shadowOpacity = .25;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.layer.shouldRasterize = YES;
    
    
    self.separator = [[UIView alloc] init];
    self.separator.backgroundColor = UIAppThemeDarkGreyColor;
    [self.bgView addSubview:self.separator];
    
    self.imgCalender = [[UIImageView alloc] initWithImage:nil];
    self.imgCalender.backgroundColor = [UIColor clearColor];
    self.imgCalender.layer.borderColor = [UIColor blackColor].CGColor;
    self.imgCalender.layer.cornerRadius = 5.0f;
    self.imgCalender.layer.borderWidth = 1.0;
    [self.bgView addSubview:self.imgCalender];
    
    self.calView1 = [[UIView alloc] init];
    self.calView1.backgroundColor = [UIColor blackColor];
    [self.bgView addSubview:self.calView1];
    
    self.calView2 = [[UIView alloc] init];
    self.calView2.backgroundColor = [UIColor blackColor];
    [self.bgView addSubview:self.calView2];
    
    self.calView3 = [[UIView alloc] init];
    self.calView3.backgroundColor = [UIColor blackColor];
    [self.bgView addSubview:self.calView3];
    
    self.lblDate = [[UILabel alloc] init];
    self.lblDate.text = @"31 Aug";
    self.lblDate.textAlignment = NSTextAlignmentCenter;
    self.lblDate.textColor = UIAppThemeFontColor;
    self.lblDate.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightSemibold];
    [self.imgCalender addSubview:self.lblDate];
    
    self.lblYear = [[UILabel alloc] init];
    self.lblYear.text = @"2015";
    self.lblYear.textAlignment = NSTextAlignmentCenter;
    self.lblYear.textColor = UIAppThemeFontColor;
    self.lblYear.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
    [self.imgCalender addSubview:self.lblYear];
    
    self.lblFromTo = [[UILabel alloc] init];
    self.lblFromTo.text = @"CHENNAI TO BANGLORE";
    self.lblFromTo.textAlignment = NSTextAlignmentLeft;
    self.lblFromTo.textColor = UIAppThemeFontColor;
    self.lblFromTo.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    [self.bgView addSubview:self.lblFromTo];
    
    self.lblTime = [[UILabel alloc] init];
    self.lblTime.text = @"08:25am";
    self.lblTime.textAlignment = NSTextAlignmentLeft;
    self.lblTime.textColor = UIAppThemeFontColor;
    self.lblTime.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    [self.bgView addSubview:self.lblTime];
    
    self.lblName = [[UILabel alloc] init];
    self.lblName.text = @"XXX Travels";
    self.lblName.textAlignment = NSTextAlignmentLeft;
    self.lblName.textColor = UIAppThemeFontColor;
    self.lblName.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    [self.bgView addSubview:self.lblName];
    
    self.imgPerk = [[UIImageView alloc] initWithImage:nil];
    self.imgPerk.backgroundColor = [UIColor orangeColor];
    self.imgPerk.layer.cornerRadius = 10.0;
    [self.bgView addSubview:self.imgPerk];
    
    self.lblPerkPoints = [[UILabel alloc] init];
    self.lblPerkPoints.text = @"Perk Points: 55";
    self.lblPerkPoints.textAlignment = NSTextAlignmentLeft;
    self.lblPerkPoints.textColor = UIAppThemeFontColor;
    self.lblPerkPoints.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    [self.bgView addSubview:self.lblPerkPoints];

    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bgView.frame = CGRectMake(10, 5, SCREEN_WIDTH-20, self.frame.size.height-5);
    self.separator.frame = CGRectMake(20, 30, CGRectGetWidth(self.bgView.frame)-40, 1);
    
    self.imgCalender.frame = CGRectMake(30, 45, 80, 80);
    self.calView1.frame = CGRectMake(50, 35, 4, 20);
    self.calView2.frame = CGRectMake(70, 35, 4, 20);
    self.calView3.frame = CGRectMake(90, 35, 4, 20);
    
    self.lblDate.frame = CGRectMake(2, 15, CGRectGetWidth(self.imgCalender.frame)-4, CGRectGetHeight(self.imgCalender.frame)/2);
    self.lblYear.frame = CGRectMake(2, CGRectGetHeight(self.imgCalender.frame)/2, CGRectGetWidth(self.imgCalender.frame)-4, CGRectGetHeight(self.imgCalender.frame)/2);
    
    self.lblFromTo.frame = CGRectMake(CGRectGetMaxX(self.imgCalender.frame)+10, CGRectGetMinY(self.imgCalender.frame), CGRectGetWidth(self.bgView.frame)-(CGRectGetMaxX(self.imgCalender.frame)+15), 20);
    self.lblTime.frame = CGRectMake(CGRectGetMaxX(self.imgCalender.frame)+10, CGRectGetMaxY(self.lblFromTo.frame), CGRectGetWidth(self.bgView.frame)-(CGRectGetMaxX(self.imgCalender.frame)+15), 20);
    self.lblName.frame = CGRectMake(CGRectGetMaxX(self.imgCalender.frame)+10, CGRectGetMaxY(self.lblTime.frame), CGRectGetWidth(self.bgView.frame)-(CGRectGetMaxX(self.imgCalender.frame)+15), 30);
    self.imgPerk.frame = CGRectMake(CGRectGetMaxX(self.imgCalender.frame)+10, CGRectGetMaxY(self.lblName.frame), 20, 20);
    
    self.lblPerkPoints.frame = CGRectMake(CGRectGetMaxX(self.imgPerk.frame)+5, CGRectGetMaxY(self.lblName.frame), CGRectGetWidth(self.bgView.frame)-(CGRectGetMaxX(self.imgPerk.frame)+10), 20);
}

@end
