//
//  ServiceHandler.m
//  Eller
//
//  Created by MuthuRaj on 21/08/15.
//  Copyright (c) 2015 Karya. All rights reserved.
//

#import "ServiceHandler.h"

@interface ServiceHandler ()

@property (nonatomic,strong) NSString *urlString,*requestParamers,*requestType;
@property (nonatomic,assign) int timout;
@property (nonatomic,strong) NSDictionary *dict;
@end

@implementation ServiceHandler

- (instancetype)initWithURL:(NSString *)urlString withRequestParameter:(NSString *)parameters andRequestType:(NSString *)requestType andTimeout:(int)timeout andPostDict:(NSDictionary *)postDict {
    self = [super init];
    if (self)
    {
        self.urlString = urlString;
        self.requestParamers = parameters;
        self.requestType = requestType;
        self.timout = timeout;
        self.dict = postDict;
    }
    
    return self;
}

- (void)main
{
    if (self.urlString && self.requestType && self.requestParamers) {
        [self performNetworkCall];
    }
}

- (void)performNetworkCall {
    
    NSError *error = nil;
    NSURLResponse *responseData = nil;
    NSData *requestData = nil;
    id data = nil;
    
    NSURL *url;
    if ([self.requestType isEqualToString:@"GET"]) {
        NSString *finalURLString = [NSString stringWithFormat:@"%@?%@",self.urlString,self.requestParamers];
        url = [NSURL URLWithString:finalURLString];
    } else {
        url = [NSURL URLWithString:self.urlString];
    }
    NSLog(@"URL : %@",url);
    NSMutableURLRequest *urlrequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:self.timout];
    
    if ([self.requestType isEqualToString:@"POST"]) {
        
        requestData = [NSJSONSerialization dataWithJSONObject:self.dict options:NSJSONWritingPrettyPrinted error:&error];
        [urlrequest setHTTPMethod:@"POST"];
        [urlrequest setValue:[NSString stringWithFormat:@"%lu", (unsigned long)requestData.length] forHTTPHeaderField:@"Content-Length"];
        [urlrequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [urlrequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [urlrequest setHTTPBody:requestData];
        
    }
    
    data = [NSURLConnection sendSynchronousRequest:urlrequest returningResponse:&responseData error:&error];
    
    NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"newStr %@", newStr);
    if (!error && data) {
        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (jsonData && !error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate serviceHandler:self andRequestStatus:YES andReponseData:jsonData andErrorMessage:nil];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate serviceHandler:self andRequestStatus:NO andReponseData:nil  andErrorMessage:error.description];
            });
        }
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate serviceHandler:self andRequestStatus:NO andReponseData:nil  andErrorMessage:error.description];
        });
    }
}

@end
