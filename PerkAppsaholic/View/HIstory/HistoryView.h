//
//  HistoryView.h
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

typedef enum {
    kHistoryPast,
    kHistoryUpcoming,
    kHistoryCanceled
}HistoryType;

@protocol HistoryViewDelegate <NSObject>

- (void)segmentChangedToIndex:(HistoryType)historyType;

@end

@interface HistoryView : UIView

@property (nonatomic, weak) id <HistoryViewDelegate> delegate;

- (void)reloadDataWithData:(NSArray *)dataArray;

@end
