//
//  ServerHandler.h
//  Eller
//
//  Created by MuthuRaj on 21/08/15.
//  Copyright (c) 2015 Karya. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ServiceHandler;

@protocol ServiceHandlerDelegate <NSObject>

- (void)serviceHandler:(ServiceHandler *)serverHandler andRequestStatus:(BOOL)status andReponseData:(id)responseData andErrorMessage:(NSString *)errorMessage;

@end

@interface ServiceHandler : NSOperation

- (instancetype)initWithURL:(NSString *)urlString withRequestParameter:(NSString *)parameters andRequestType:(NSString *)requestType andTimeout:(int)timeout andPostDict:(NSDictionary*)postDict;

@property (nonatomic,weak) id<ServiceHandlerDelegate>delegate;

@end
