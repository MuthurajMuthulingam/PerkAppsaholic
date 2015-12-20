//
//  PlanViewController.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "PlanViewController.h"
#import "PlanView.h"
#import "DataParserOperation.h"
#import "ServiceHandler.h"
#import "AppsaholicSDK.h"

@interface PlanViewController ()<ServiceHandlerDelegate,DataParserDelegate,planViewDelegate>

@property (nonatomic, strong) PlanView *view;

@end

@implementation PlanViewController

@dynamic view;

- (void)loadView {
    
    self.view = [[PlanView alloc] init];
    self.view.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (id)readDataFromLocal {

    NSError *error;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Buses" ofType:@"json"];
    NSString *jsonStringFromFile = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        NSData *rawJSONData = [jsonStringFromFile dataUsingEncoding:NSUTF8StringEncoding];

        id jsonSerialisedData = [NSJSONSerialization JSONObjectWithData:rawJSONData options:NSJSONReadingMutableLeaves error:&error];
        if (!error) {
            return jsonSerialisedData;
        }
    }
    return nil;
}


#pragma mark - Plan View delegate

- (void)planView:(PlanView *)planView selectedDictDetails:(NSDictionary *)selectedDataDict {
    
    NSString *requestParameterString = [NSString stringWithFormat:@"startPoint=%@&endPoint=%@&date=%@",[selectedDataDict objectForKey:@"StartPoint"],[selectedDataDict objectForKey:@"ToPoint"],[selectedDataDict objectForKey:@"Date"]];
    
    ServiceHandler *serviceHandler = [[ServiceHandler alloc] initWithURL:@"http:/localhost/BusServices/" withRequestParameter:requestParameterString andRequestType:@"GET" andTimeout:20 andPostDict:nil];
    serviceHandler.delegate = self;
    [serviceHandler start];
}

#pragma mark - Service Handler Delegate 

- (void)serviceHandler:(ServiceHandler *)serverHandler andRequestStatus:(BOOL)status andReponseData:(id)responseData andErrorMessage:(NSString *)errorMessage {
    NSLog(@"Server Response %@",responseData);
    //responseData = [self readDataFromLocal];
    if (responseData) {
        DataParserOperation *dataOperation = [[DataParserOperation alloc] initWithRawData:responseData];
        dataOperation.delegate = self;
        [dataOperation start];
    }
}

#pragma mark - DataParser delegates

- (void)dataParser:(DataParserOperation *)dataParser parsedData:(NSArray *)parsedData {
    NSLog(@"response Data after Parsing %@",parsedData);
    [self.view reloadTableData:parsedData];
}

- (void)addPoints:(NSInteger)points {
    
    [[AppsaholicSDK sharedManager] trackEvent:@"d989f7d005b3701b1ca170f4e3382ceaaee05dc6" withSubID:@"nil" notificationType:NO withController:self withSuccess:^(BOOL success, NSString *notificationtext, NSNumber *pointEarned) {
        NSLog(@"Achivement !!! Points Earned : %d,NotificationText %@",pointEarned.intValue,notificationtext);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
