//
//  DataOperation.h
//  sample_db
//
//  Created by Muthuraj M on 24/08/15.
//  Copyright (c) 2015 KaryaTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  DataOperation;

@protocol DataOperationDelegate <NSObject>

- (void)dataOperation:(DataOperation *)dataOperation OperationStatus:(BOOL)operationStatus resultDataArray:(NSArray *)dataArray andItsCount:(int)dataCount;

@end

typedef enum {
    CREATE = 111,
    INSERT = 211,
    SELECT = 311,
    DELETE = 411,
    UPDATE = 511,
    COUNT = 611
} DatabaseOperation;

@interface DataOperation : NSOperation

@property (nonatomic,weak) id<DataOperationDelegate>delegate;
- (instancetype)initWithQuery:(NSString *)query andOperation:(DatabaseOperation)databaseOpeartion;

@end
