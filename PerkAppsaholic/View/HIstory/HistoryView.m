//
//  HistoryView.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HistoryView.h"
#import "AppConstants.h"
#import "Utilities.h"
#import "HistoryCell.h"

@interface HistoryView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UISegmentedControl *segment;

@end

@implementation HistoryView

- (id)init {
    self = [super init];
    
    if (self) {
        self.dataArray = [[NSMutableArray alloc] init];
        [self createViews];
    }
    
    return self;
}

- (void)createViews {
    
    self.backgroundColor = APP_THEME_COLOUR;
    
    self.segment = [[UISegmentedControl alloc] initWithItems:@[@"PAST",@"UPCOMING",@"CANCELED"]];
    self.segment.backgroundColor = UIAppThemeWhiteColor;
    self.segment.layer.cornerRadius = 4.0f;
    self.segment.clipsToBounds = YES;
    self.segment.tintColor = UIColorFromRGB(0xbababa);
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [Utilities regularFontHeaderTwo], NSFontAttributeName,
                                UIAppThemeFontColor, NSForegroundColorAttributeName,
                                nil];
    [self.segment setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:UIAppThemeFontColor forKey:NSForegroundColorAttributeName];
    [self.segment setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    [self.segment addTarget:self action:@selector(segmentChanged) forControlEvents:UIControlEventValueChanged];
    
    [self.segment setSelectedSegmentIndex:1];
    [self segmentChanged];
    
    [self addSubview:self.segment];
    
    self.segment.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.segment.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.segment.layer.shadowRadius = 0.5;
    self.segment.layer.shadowOpacity = .25;
    self.segment.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.segment.layer.shouldRasterize = YES;
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.tableView];
    
    [self.tableView registerClass:[HistoryCell class] forCellReuseIdentifier:[HistoryCell reuseIdentifier]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.segment.frame = CGRectMake(15, 10, SCREEN_WIDTH-30, 35);
    self.tableView.frame = CGRectMake(0, 55, SCREEN_WIDTH, CGRectGetHeight(self.frame)-60);
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:[HistoryCell reuseIdentifier] forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    return cell;
}

- (void)segmentChanged {
    
    NSLog(@"segmentChanged");
    
    if ([self.delegate respondsToSelector:@selector(segmentChangedToIndex:)]) {
        [self.delegate segmentChangedToIndex:(HistoryType)self.segment.selectedSegmentIndex];
    }
}

@end
