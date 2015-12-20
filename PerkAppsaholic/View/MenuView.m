//
//  MenuView.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "MenuView.h"
#import "AppConstants.h"
#import "Utilities.h"
#import "MenuCell.h"

@interface MenuView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MenuView

- (id)init {
    self = [super init];
    
    if (self) {
        self.dataArray = [[NSArray alloc] initWithObjects:@"History", @"Plane New Journey", @"View Portal", nil];
        [self createViews];
    }
    return self;
}

- (void)createViews {
    
    self.headerView = [[UIView alloc] init];
    self.headerView.backgroundColor = [UIColor greenColor];//UIColorFromRGB(0xe55656);
    [self addSubview:self.headerView];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorColor = UIColorFromRGB(0xf5f5f5);
    
    [self.tableView registerClass:[MenuCell class] forCellReuseIdentifier:[MenuCell reuseIdentifier]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self addSubview:self.tableView];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 75);
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-CGRectGetMaxY(self.headerView.frame));
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
    cell.separatorInset = UIEdgeInsetsZero;
    return cell;
}
@end
