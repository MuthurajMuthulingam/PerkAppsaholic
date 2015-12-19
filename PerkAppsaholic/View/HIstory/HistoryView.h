//
//  HistoryView.h
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kHistoryPast,
    kHistoryUpcoming,
    kHistoryCanceled
}HistoryType;

@protocol HistoryViewDelegate <NSObject>

- (void)segmentChangedToIndex:(HistoryType)historyType;

@end

@interface HistoryView : UIView

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, weak) id <HistoryViewDelegate> delegate;

@end
