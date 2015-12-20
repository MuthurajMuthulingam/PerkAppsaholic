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
#import "HistoryModel.h"

@interface HistoryView ()<UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *dicSelectedCancel;

@end

@implementation HistoryView

- (id)init {
    self = [super init];
    
    if (self) {
        self.dataArray = [NSArray array];
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:[HistoryCell reuseIdentifier] forIndexPath:indexPath];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.layoutMargins = UIEdgeInsetsZero;
//    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
//    [cell updateCellWithData:[self.dataArray objectAtIndex:indexPath.row]];
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:[HistoryCell reuseIdentifier] forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.fbShare addTarget:self action:@selector(fbSharedClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    [cell updateCellWithData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.dicSelectedCancel = [self.dataArray objectAtIndex:indexPath.row];
    if (self.segment.selectedSegmentIndex == 1) {
        HistoryCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:cell.lblFromTo.text
                                                        message:[NSString stringWithFormat:@"Cancel the tickets for this bus departing at %@ on %@ %@",cell.lblTime.text,cell.lblDate.text,cell.lblYear.text]
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"YES", nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        NSLog(@"ticket booked");
        [[HistoryModel sharedInstance] addCancelHistoryData:self.dicSelectedCancel];
        [[HistoryModel sharedInstance] removeUpcomingHistroyData:self.dicSelectedCancel];
        [self.tableView reloadData];
    }
}

- (void)fbSharedClicked:(UIButton *)sender {
    [self.delegate historyView:self fbShareButtonClicked:sender];
}

- (void)segmentChanged {
    
    NSLog(@"segmentChanged");
    
        [self.delegate historyView:self segmentChangedToIndex:(HistoryType)self.segment.selectedSegmentIndex];
}

#pragma mark - reloading Data Table

- (void)reloadDataWithData:(NSArray *)dataArray {
    __weak HistoryView *weakHistoryView = self;
    self.dataArray = dataArray;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakHistoryView.tableView reloadData];
    });
}

@end
