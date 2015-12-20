//
//  HistoryModel.h
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/20/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryModel : NSObject
+ (HistoryModel *)sharedInstance;
- (NSArray*)getUpcomingHistory;
- (NSArray*)getCancelHistory;
- (NSArray*)getPastHistory;
- (void)addData:(NSDictionary *)dic;
- (void)cancelData:(NSDictionary *)dic;
- (void)addUpcomingHistroyData:(NSDictionary *)dic;
- (void)removeUpcomingHistroyData:(NSDictionary *)dic;
- (void)addCancelHistoryData:(NSDictionary *)dic;
- (void)removeCancelHistoryData:(NSDictionary *)dic;
- (void)addPastHistoryData:(NSDictionary *)dic;
- (void)removePastHistoryData:(NSDictionary *)dic;
@end
