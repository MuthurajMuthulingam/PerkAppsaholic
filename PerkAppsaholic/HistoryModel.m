//
//  HistoryModel.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/20/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HistoryModel.h"

@implementation HistoryModel
static NSMutableArray *aryUpcomingHistory;
static NSMutableArray *aryPastHistory;
static NSMutableArray *aryCancelHistory;
+ (HistoryModel *)sharedInstance
{
    //  Static local predicate must be initialized to 0
    static HistoryModel *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HistoryModel alloc] init];
        // Do any other initialisation stuff here
        aryUpcomingHistory = [[NSMutableArray alloc] init];
        aryPastHistory = [[NSMutableArray alloc] init];
        aryCancelHistory = [[NSMutableArray alloc] init];
    });
    return sharedInstance;
}
- (void)addUpcomingHistroyData:(NSDictionary *)dic {
    [aryUpcomingHistory addObject:dic];
}
- (void)removeUpcomingHistroyData:(NSDictionary *)dic {
    [aryUpcomingHistory removeObject:dic];
}
- (void)addCancelHistoryData:(NSDictionary *)dic {
    [aryCancelHistory addObject:dic];
}
- (void)removeCancelHistoryData:(NSDictionary *)dic {
    [aryCancelHistory removeObject:dic];
}
- (void)addPastHistoryData:(NSDictionary *)dic {
    [aryPastHistory addObject:dic];
}
- (void)removePastHistoryData:(NSDictionary *)dic {
    [aryPastHistory removeObject:dic];
}

- (NSArray *)getUpcomingHistory {
    return aryUpcomingHistory;
}
- (NSArray *)getCancelHistory {
    return aryCancelHistory;
}
- (NSArray *)getPastHistory {
    return aryPastHistory;
}
@end
