//
//  HistoryViewController.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryView.h"
#import "HistoryModel.h"
#import "Utilities.h"
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface HistoryViewController ()<HistoryViewDelegate>

@property (nonatomic, strong) HistoryView *view;

@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation HistoryViewController

@dynamic view;

- (void)loadView {
    [super loadView];
    
    self.view = [[HistoryView alloc] init];
    self.view.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSArray array];
    
    [self historyView:self.view segmentChangedToIndex:kHistoryUpcoming];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark HistoryViewDelegate Methods

- (void)historyView:(HistoryView *)historyView segmentChangedToIndex:(HistoryType)historyType  {
    NSLog(@"segement changed to index %d",historyType);
    NSArray *dataArray = [NSArray array];
    switch (historyType) {
        case kHistoryPast: {
            
            dataArray = @[@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About"];
            }
            dataArray = [[HistoryModel sharedInstance] getPastHistory];
            break;
        case kHistoryUpcoming: {
            dataArray = @[@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About"];
        }
            dataArray = [[HistoryModel sharedInstance] getUpcomingHistory];
            break;
        case kHistoryCanceled: {
            dataArray = @[@"History", @"Plan New Journey", @"About",@"History", @"Plan New Journey", @"About"];
        }
            dataArray = [[HistoryModel sharedInstance] getCancelHistory];
            break;
            
        default:
            break;
    }
    
    [self.view reloadDataWithData:dataArray];
}

- (void)historyView:(HistoryView *)historyView selectedDataDict:(NSDictionary *)dataDict {
//    NSString *alertString = [NSString stringWithFormat:@"Cancel the tickets for this bus departing at %@ on %@ %@",@"19 dec",@"2015"];
//    [Utilities showAlertWithMessage:alertString];//
}

- (void)historyView:(HistoryView *)historyView fbShareButtonClicked:(UIButton *)fbButton {
        FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
        content.contentURL = [NSURL URLWithString:@"http://www.google.com"];
        content.contentDescription = @"Perk Appsaholic Testing...";
        [FBSDKShareDialog showFromViewController:self
                                     withContent:content
                                        delegate:nil];
}

@end
