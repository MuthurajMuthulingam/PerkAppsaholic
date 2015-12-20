//
//  HistoryView.h
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

@class HistoryView;

typedef enum {
    kHistoryPast,
    kHistoryUpcoming,
    kHistoryCanceled
}HistoryType;

@protocol HistoryViewDelegate <NSObject>

- (void)historyView:(HistoryView *)historyView segmentChangedToIndex:(HistoryType)historyType;
- (void)historyView:(HistoryView *)historyView selectedDataDict:(NSDictionary *)dataDict;
- (void)historyView:(HistoryView *)historyView fbShareButtonClicked:(UIButton *)fbButton;
@end

@interface HistoryView : UIView

@property (nonatomic, weak) id <HistoryViewDelegate> delegate;

- (void)reloadDataWithData:(NSArray *)dataArray;

@end
