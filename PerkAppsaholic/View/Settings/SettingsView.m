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
#import "MenuCell.h"

@interface SettingsView ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SettingsView

- (id)init {
    self = [super init];
    
    if (self) {
        self.dataArray = [[NSArray alloc] initWithObjects:@"History", @"Plan New Journey", @"Settings", nil];
        [self createViews];
    }
    
    return self;
}

- (void)createViews {
    
    self.backgroundColor = APP_THEME_COLOUR;
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    self.tableView.separatorColor = UIColorFromRGB(0xbababa);
    self.tableView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.tableView];
    
    [self.tableView registerClass:[MenuCell class] forCellReuseIdentifier:[MenuCell reuseIdentifier]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView.frame = self.bounds;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    cell.title.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.title.textColor = [UIColor blackColor];
    cell.title.textAlignment = NSTextAlignmentCenter;
    return cell;
}

@end
