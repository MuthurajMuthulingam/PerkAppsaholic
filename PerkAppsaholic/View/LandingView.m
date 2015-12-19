//
//  LandingView.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "LandingView.h"
#import "AppConstants.h"
#import "Utilities.h"
#import "MenuView.h"
#import "MenuCell.h"

@interface LandingView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIButton *btnHam;
@property (nonatomic, strong) UIImageView *imgHam;
@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) UIView *menuView;
@property (nonatomic) BOOL isAnimating;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UIImageView *imgProfilePic;
@property (nonatomic, strong) UILabel *lblUserName;
@property (nonatomic, strong) UILabel *lblUserID;
@property (nonatomic, strong) UIImageView *imgPerks;
@property (nonatomic, strong) UILabel *lblPerks;

@end

@implementation LandingView

- (id)init {
    self = [super init];
    
    if (self) {
        self.dataArray = [[NSArray alloc] initWithObjects:@"History", @"Plane New Journey", @"Settings", nil];
        [self createViews];
    }
    
    return self;
}

- (void)createViews {
    
    self.backgroundColor = APP_THEME_COLOUR;
    
    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = UIColorFromRGB(0xe55656);
    [self addSubview:self.headerView];
    
    self.lblTitle = [[UILabel alloc] init];
    self.lblTitle.text = @"Title";
    self.lblTitle.textAlignment = NSTextAlignmentCenter;
    self.lblTitle.textColor = [UIColor whiteColor];
    self.lblTitle.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    [self.headerView addSubview:self.lblTitle];
    
    self.imgHam = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Ham"]];
    self.imgHam.tintColor = [UIColor whiteColor];
    [self.headerView addSubview:self.imgHam];
    
    self.btnHam = [[UIButton alloc] init];
    [self.btnHam setBackgroundColor:[UIColor clearColor]];
    [self.btnHam addTarget:self action:@selector(showPerkMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:self.btnHam];
    
    self.menuView = [[UIView alloc] init];
    self.menuView.backgroundColor = UIColorFromRGB(0xe55656);
    [self addSubview:self.menuView];
    
    [self createMenuViews];
}

- (void)createMenuViews {
    
    self.imgProfilePic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    self.imgProfilePic.tintColor = [UIColor blackColor];
    self.imgProfilePic.backgroundColor = [UIColor whiteColor];
    self.imgProfilePic.layer.cornerRadius = 30;
    [self.menuView addSubview:self.imgProfilePic];
    
    self.lblUserName = [[UILabel alloc] init];
    self.lblUserName.text = @"user1";
    self.lblUserName.textAlignment = NSTextAlignmentLeft;
    self.lblUserName.textColor = [UIColor whiteColor];
    self.lblUserName.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    [self.menuView addSubview:self.lblUserName];
    [self.lblUserName sizeToFit];
    
    self.lblUserID = [[UILabel alloc] init];
    self.lblUserID.text = @"A2Y679HE7EBEHIE03N2J";
    self.lblUserID.textAlignment = NSTextAlignmentLeft;
    self.lblUserID.textColor = [UIColor whiteColor];
    self.lblUserID.font = [UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
    [self.menuView addSubview:self.lblUserID];
    [self.lblUserID sizeToFit];
    
    self.imgPerks = [[UIImageView alloc] initWithImage:nil];
    self.imgPerks.tintColor = [UIColor blackColor];
    self.imgPerks.backgroundColor = [UIColor whiteColor];
    self.imgPerks.layer.cornerRadius = 10;
    [self.menuView addSubview:self.imgPerks];
    
    self.lblPerks = [[UILabel alloc] init];
    self.lblPerks.text = @"5628";
    self.lblPerks.textAlignment = NSTextAlignmentLeft;
    self.lblPerks.textColor = [UIColor whiteColor];
    self.lblPerks.font = [UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
    [self.menuView addSubview:self.lblPerks];
    [self.lblPerks sizeToFit];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    self.tableView.separatorColor = UIColorFromRGB(0xf5f5f5);
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[MenuCell class] forCellReuseIdentifier:[MenuCell reuseIdentifier]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:self.tableView];
    
    [self.tableView reloadData];
    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 75);

    if (!self.isAnimating) {
        self.lblTitle.frame = CGRectMake(0, CGRectGetHeight(self.headerView.frame)-30, SCREEN_WIDTH, 20);
        self.imgHam.frame = CGRectMake(10, CGRectGetHeight(self.headerView.frame)-30, 25, 20);
        self.btnHam.frame = CGRectMake(0, CGRectGetMinY(self.imgHam.frame)-10, CGRectGetWidth(self.imgHam.frame)+20, 40);
        
        self.menuView.frame = CGRectMake(0, 0, 0, SCREEN_HEIGHT);
        self.imgProfilePic.frame = CGRectMake(10, 50, 0, 60);
        self.tableView.frame = CGRectMake(0, 150, 0, SCREEN_HEIGHT-100);
        self.lblUserName.frame = CGRectMake(CGRectGetMaxX(self.imgProfilePic.frame)+30, 75, 0, CGRectGetHeight(self.lblUserName.frame));
        self.lblUserID.frame = CGRectMake(CGRectGetMaxX(self.imgProfilePic.frame)+30, CGRectGetMaxY(self.lblUserName.frame), 0, CGRectGetHeight(self.lblUserID.frame));
        
        self.imgPerks.frame = CGRectMake(10, CGRectGetMaxY(self.imgProfilePic.frame)+10, 0, 20);
        self.lblPerks.frame = CGRectMake(CGRectGetMaxX(self.imgPerks.frame)+5, CGRectGetMaxY(self.imgProfilePic.frame)+10, 0, 20);
    }
}

- (void)showPerkMenu {
    
    NSLog(@"show perk menu");
    
    self.isAnimating = YES;
    
    if (CGRectGetWidth(self.menuView.frame) == 0) {
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             self.menuView.frame = CGRectMake(0, 0, SCREEN_WIDTH-100, SCREEN_HEIGHT);
                             self.imgHam.frame = CGRectMake(SCREEN_WIDTH-90, CGRectGetMinY(self.imgHam.frame), CGRectGetWidth(self.imgHam.frame), CGRectGetHeight(self.imgHam.frame));
                             self.btnHam.frame = CGRectMake(SCREEN_WIDTH-100, CGRectGetMinY(self.btnHam.frame), CGRectGetWidth(self.btnHam.frame), CGRectGetHeight(self.btnHam.frame));
                             self.lblTitle.frame = CGRectMake(SCREEN_WIDTH-100, CGRectGetHeight(self.headerView.frame)-30, SCREEN_WIDTH, 20);
                             self.tableView.frame = CGRectMake(0, 150, SCREEN_WIDTH-100, SCREEN_HEIGHT-100);
                             self.imgProfilePic.frame = CGRectMake(10, 50, 60, 60);
                             
                             [self.lblUserName sizeToFit];
                             self.lblUserName.frame = CGRectMake(CGRectGetMaxX(self.imgProfilePic.frame)+30, 75, CGRectGetWidth(self.lblUserName.frame), CGRectGetHeight(self.lblUserName.frame));
                             [self.lblUserID sizeToFit];
                             self.lblUserID.frame = CGRectMake(CGRectGetMaxX(self.imgProfilePic.frame)+30, CGRectGetMaxY(self.lblUserName.frame), CGRectGetWidth(self.lblUserID.frame), CGRectGetHeight(self.lblUserID.frame));
                             self.imgPerks.frame = CGRectMake(10, CGRectGetMaxY(self.imgProfilePic.frame)+10, 20, 20);
                             [self.lblPerks sizeToFit];
                             self.lblPerks.frame = CGRectMake(CGRectGetMaxX(self.imgPerks.frame)+5, CGRectGetMaxY(self.imgProfilePic.frame)+10, CGRectGetWidth(self.lblPerks.frame), 20);
                         }
                         completion:^(BOOL finished){
                             self.isAnimating = NO;
                         }];
    } else {
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             self.imgHam.frame = CGRectMake(10, CGRectGetHeight(self.headerView.frame)-30, 25, 20);
                             self.btnHam.frame = CGRectMake(0, CGRectGetMinY(self.imgHam.frame)-10, CGRectGetWidth(self.imgHam.frame)+20, 40);
                             self.menuView.frame = CGRectMake(0, 0, 0, SCREEN_HEIGHT);
                             self.lblTitle.frame = CGRectMake(0, CGRectGetHeight(self.headerView.frame)-30, SCREEN_WIDTH, 20);
                             self.tableView.frame = CGRectMake(0, 150, 0, SCREEN_HEIGHT-100);
                             self.imgProfilePic.frame = CGRectMake(10, 50, 0, 60);
                             [self.lblUserName sizeToFit];
                             self.lblUserName.frame = CGRectMake(CGRectGetMaxX(self.imgProfilePic.frame)+30, 75, 0, CGRectGetHeight(self.lblUserName.frame));
                             [self.lblUserID sizeToFit];
                             self.lblUserID.frame = CGRectMake(CGRectGetMaxX(self.imgProfilePic.frame)+30, CGRectGetMaxY(self.lblUserName.frame), 0, CGRectGetHeight(self.lblUserID.frame));
                             self.imgPerks.frame = CGRectMake(10, CGRectGetMaxY(self.imgProfilePic.frame)+10, 0, 20);
                             
                             self.lblPerks.frame = CGRectMake(CGRectGetMaxX(self.imgPerks.frame)+5, CGRectGetMaxY(self.imgProfilePic.frame)+10, 0, 20);
                         }
                         completion:^(BOOL finished){
                             self.isAnimating = NO;
                         }];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:[MenuCell reuseIdentifier] forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    cell.title.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.lblTitle.text = [self.dataArray objectAtIndex:indexPath.row];
}

@end
