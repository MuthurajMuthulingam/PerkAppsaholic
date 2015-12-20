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
- (void)addData:(NSDictionary *)dic;
- (void)cancelData:(NSDictionary *)dic;
- (NSArray *)getHistory;
@end
