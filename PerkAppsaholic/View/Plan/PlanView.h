//
//  PlanView.h
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

@class PlanView;
@protocol planViewDelegate <NSObject>

- (void)planView:(PlanView *)planView selectedDictDetails:(NSDictionary *)selectedDataDict;

@end
@interface PlanView : UIView

@property (nonatomic,weak) id<planViewDelegate>delegate;

- (void)reloadTableData:(NSArray *)dataArray;

@end
