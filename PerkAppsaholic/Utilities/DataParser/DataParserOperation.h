//
//  DataParserOperation.h
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/19/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataParserOperation;

@protocol DataParserDelegate <NSObject>

- (void)dataParser:(DataParserOperation *)dataParser   parsedData:(NSArray *)parsedData;

@end

@interface DataParserOperation : NSOperation

@property (nonatomic,weak) id<DataParserDelegate>delegate;

- (instancetype)initWithRawData:(id)rawData;

@end
