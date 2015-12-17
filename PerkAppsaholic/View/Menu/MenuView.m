//
//  MenuView.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/16/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "MenuView.h"

#define cellIdentifier @"cell"

@interface MenuView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *menuTable;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation MenuView

- (instancetype)init {
    if (self = [super init]) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    self.menuTable = [[UITableView alloc] init];
    self.menuTable.dataSource = self;
    self.menuTable.delegate = self;
    [self addSubview:self.menuTable];
    
    [self.menuTable registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.dataArray = [NSArray arrayWithObjects:@"Cell",@"CEll",nil];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.menuTable.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark - Menu Table Delegates and Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}
@end
