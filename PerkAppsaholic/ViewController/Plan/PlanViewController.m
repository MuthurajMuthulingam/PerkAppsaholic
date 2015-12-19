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

@interface PlanViewController ()<ServiceHandlerDelegate,DataParserDelegate>

@property (nonatomic, strong) PlanView *view;

@end

@implementation PlanViewController

@dynamic view;

- (void)loadView {
    
    self.view = [[PlanView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ServiceHandler *serviceHandler = [[ServiceHandler alloc] initWithURL:@"www.google.com" withRequestParameter:@"" andRequestType:@"GET" andTimeout:20 andPostDict:nil];
    serviceHandler.delegate = self;
    [serviceHandler start];
    
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


#pragma mark - Service Handler Delegate 

- (void)serviceHandler:(ServiceHandler *)serverHandler andRequestStatus:(BOOL)status andReponseData:(id)responseData andErrorMessage:(NSString *)errorMessage {
    NSLog(@"Server Response %@",responseData);
    responseData = [self readDataFromLocal];
    if (responseData) {
        DataParserOperation *dataOperation = [[DataParserOperation alloc] initWithRawData:responseData];
        dataOperation.delegate = self;
        [dataOperation start];
    }
}

#pragma mark - DataParser delegates

- (void)dataParser:(DataParserOperation *)dataParser parsedData:(NSArray *)parsedData {
    NSLog(@"response Data after Parsing %@",parsedData);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
