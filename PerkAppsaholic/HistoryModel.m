//
//  HistoryModel.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/20/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "HistoryModel.h"

@implementation HistoryModel
static NSMutableArray *aryHistory;
+ (HistoryModel *)sharedInstance
{
    //  Static local predicate must be initialized to 0
    static HistoryModel *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HistoryModel alloc] init];
        // Do any other initialisation stuff here
        aryHistory = [[NSMutableArray alloc] init];
    });
    return sharedInstance;
}
- (void)addData:(NSDictionary *)dic {
    [aryHistory addObject:dic];
}
- (void)cancelData:(NSDictionary *)dic {
    [aryHistory removeObject:dic];
}
- (NSArray *)getHistory {
    return aryHistory;
}
@end
