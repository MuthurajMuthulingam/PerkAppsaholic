//
//  DataParserOperation.m
//  PerkAppsaholic
//
//  Created by Muthuraj Muthulingam on 12/19/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "DataParserOperation.h"

@interface DataParserOperation ()

@property (nonatomic,strong) id rawData;

@end

@implementation DataParserOperation

- (instancetype)initWithRawData:(id)rawData {
    self = [super init];
    if (self) {
        NSAssert(!self.rawData, @"data Should Has Value");
        self.rawData = rawData;
    }
    return self;
}

- (void)main {
    [self startParseData];
}

#pragma mark - Parse Data

- (void)startParseData {
    
    if ([self.rawData isKindOfClass:[NSArray class]]) { // JSON Array
        
        [self.delegate dataParser:self parsedData:self.rawData];
        
    } else if ([self.rawData isKindOfClass:[NSDictionary class]]) {// JSON Dict
        
    }
}

@end
