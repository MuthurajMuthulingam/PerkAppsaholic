//
//  PlanView.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "PlanView.h"
#import "HistoryCell.h"
#import "AppConstants.h"
#import "Utilities.h"

@interface PlanView ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *imgFrom;
@property (nonatomic, strong) UIImageView *imgTo;
@property (nonatomic, strong) UITextField *txtFrom;
@property (nonatomic, strong) UITextField *txtTo;
@property (nonatomic, strong) UIView *separator;

@property (nonatomic, strong) UIView *dateView;
@property (nonatomic, strong) UIImageView *imgeCalender;
@property (nonatomic, strong) UILabel *lbldate;
@property (nonatomic, strong) UIButton *btnDate;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (nonatomic, strong) UIButton *btnSearch;


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;


@end

@implementation PlanView

- (id)init {
    self = [super init];
    
    if (self) {
        self.dataArray = [NSArray array];
        [self createViews];
    }
    
    return self;
}

- (void)createViews {
    
    self.backgroundColor = APP_THEME_COLOUR;
    
    self.scrollview = [[UIScrollView alloc] init];
    self.scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-75);
    self.scrollview.backgroundColor = [UIColor clearColor];
    [self addSubview:self.scrollview];
    
    self.bgView = [UIView new];
    [self.bgView setBackgroundColor:UIAppThemeWhiteColor];
    self.bgView.layer.cornerRadius = 8.0f;
    self.bgView.clipsToBounds = YES;
    [self.scrollview addSubview:self.bgView];
    self.bgView.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.bgView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.bgView.layer.shadowRadius = 2.0;
    self.bgView.layer.shadowOpacity = .8;
    self.bgView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.bgView.layer.shouldRasterize = YES;
    
    self.separator = [[UIView alloc] init];
    self.separator.backgroundColor = UIAppThemeDarkGreyColor;
    [self.bgView addSubview:self.separator];
    
    self.imgFrom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location"]];
    [self.bgView addSubview:self.imgFrom];
    
    self.imgTo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location"]];
    [self.bgView addSubview:self.imgTo];
    
    self.txtFrom = [[UITextField alloc] init];
    self.txtFrom.backgroundColor = [UIColor clearColor];
    self.txtFrom.textAlignment = NSTextAlignmentLeft;
    self.txtFrom.keyboardType = UIKeyboardTypeEmailAddress;
    self.txtFrom.font = [Utilities regularFontofSize:20];
    self.txtFrom.textColor = UIAppThemeFontColor;
    self.txtFrom.delegate = self;
    self.txtFrom.returnKeyType = UIReturnKeyNext;
    self.txtFrom.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.txtFrom.autocorrectionType = UITextAutocorrectionTypeNo;
    self.txtFrom.spellCheckingType = UITextSpellCheckingTypeNo;
    self.txtFrom.placeholder = @"From";
    self.txtFrom.layer.cornerRadius = 4.0f;
    self.txtFrom.clipsToBounds = YES;
    self.txtFrom.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.txtFrom.enablesReturnKeyAutomatically = YES;
    self.txtFrom.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"From" attributes:@{NSForegroundColorAttributeName: UIAppThemeLightGreyColor, NSFontAttributeName : [Utilities regularFontofSize:20]}];
    [self.bgView addSubview:self.txtFrom];
    
    self.txtTo = [[UITextField alloc] init];
    self.txtTo.backgroundColor = [UIColor clearColor];
    self.txtTo.textAlignment = NSTextAlignmentLeft;
    self.txtTo.keyboardType = UIKeyboardTypeEmailAddress;
    self.txtTo.font = [Utilities regularFontofSize:20];
    self.txtTo.textColor = UIAppThemeFontColor;
    self.txtTo.delegate = self;
    self.txtTo.returnKeyType = UIReturnKeyNext;
    self.txtTo.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.txtTo.autocorrectionType = UITextAutocorrectionTypeNo;
    self.txtTo.spellCheckingType = UITextSpellCheckingTypeNo;
    self.txtTo.placeholder = @"To";
    self.txtTo.layer.cornerRadius = 4.0f;
    self.txtTo.clipsToBounds = YES;
    self.txtTo.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.txtTo.enablesReturnKeyAutomatically = YES;
    self.txtTo.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"To" attributes:@{NSForegroundColorAttributeName: UIAppThemeLightGreyColor, NSFontAttributeName : [Utilities regularFontofSize:20]}];
    [self.bgView addSubview:self.txtTo];
    
    
    self.dateView = [[UIView alloc] init];
    [self.dateView setBackgroundColor:UIAppThemeWhiteColor];
    self.dateView.layer.cornerRadius = 8.0f;
    self.dateView.clipsToBounds = YES;
    [self.scrollview addSubview:self.dateView];
    self.dateView.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.dateView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.dateView.layer.shadowRadius = 2.0;
    self.dateView.layer.shadowOpacity = .8;
    self.dateView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.dateView.layer.shouldRasterize = YES;
    
    self.imgeCalender = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calendar"]];
    self.imgeCalender.backgroundColor = [UIColor clearColor];
    [self.dateView addSubview:self.imgeCalender];
    
    NSDate *today = [NSDate date];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd MMM YY"];
    
    self.lbldate = [[UILabel alloc] init];
    self.lbldate.text = [self.dateFormatter stringFromDate:today];
    self.lbldate.textAlignment = NSTextAlignmentLeft;
    self.lbldate.textColor = UIAppThemeLightGreyColor;
    self.lbldate.font = [Utilities regularFontHeaderOne];
    [self.dateView addSubview:self.lbldate];
    
    self.btnDate = [[UIButton alloc] init];
    [self.btnDate setBackgroundColor:[UIColor clearColor]];
    [self.btnDate addTarget:self action:@selector(selectDate) forControlEvents:UIControlEventTouchUpInside];
    [self.dateView addSubview:self.btnDate];
    
    self.btnSearch = [[UIButton alloc] init];
    [self.btnSearch setBackgroundColor:UIColorFromRGB(0xe55656)];
    self.btnSearch.layer.cornerRadius = 8.0f;
    [self.btnSearch setTitle:@"Search For Buses" forState:UIControlStateNormal];
    [self.btnSearch setTitleColor:UIAppThemeWhiteColor forState:UIControlStateNormal];
    [self.btnSearch addTarget:self action:@selector(searchForBuses) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.btnSearch];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.scrollview addSubview:self.tableView];
    self.tableView.hidden = YES;
    
    [self.tableView registerClass:[HistoryCell class] forCellReuseIdentifier:[HistoryCell reuseIdentifier]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.scrollview.frame = self.bounds;
    
    self.bgView.frame = CGRectMake(30, 50, SCREEN_WIDTH-60, 120);
    self.separator.frame = CGRectMake(20, CGRectGetHeight(self.bgView.frame)/2, CGRectGetWidth(self.bgView.frame)-40, 1);
    
    self.imgFrom.frame = CGRectMake(20, 15, 22, 30);
    self.imgTo.frame = CGRectMake(20, (CGRectGetHeight(self.bgView.frame)/2)+15, 22, 30);
    
    self.txtFrom.frame = CGRectMake(CGRectGetMaxX(self.imgFrom.frame)+10, 5, CGRectGetWidth(self.bgView.frame)-(CGRectGetMaxX(self.imgFrom.frame)+30), (CGRectGetHeight(self.bgView.frame)/2)-5);
    self.txtTo.frame = CGRectMake(CGRectGetMaxX(self.imgTo.frame)+10, (CGRectGetHeight(self.bgView.frame)/2)+5, CGRectGetWidth(self.bgView.frame)-(CGRectGetMaxX(self.imgFrom.frame)+30), (CGRectGetHeight(self.bgView.frame)/2)-5);
    
    
    self.dateView.frame = CGRectMake(30, CGRectGetMaxY(self.bgView.frame)+30, SCREEN_WIDTH-60, 50);
    self.imgeCalender.frame = CGRectMake(10, 12, 25, 25);
    self.lbldate.frame = CGRectMake(CGRectGetMaxX(self.imgeCalender.frame)+10, 0, CGRectGetWidth(self.dateView.frame)-(CGRectGetMaxX(self.imgeCalender.frame)+15), CGRectGetHeight(self.dateView.frame));
    self.btnDate.frame = self.dateView.bounds;
    
    self.btnSearch.frame = CGRectMake(30, CGRectGetMaxY(self.dateView.frame)+50, SCREEN_WIDTH-60, 50);
    
    if (!self.tableView.hidden) {
        self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.btnSearch.frame)+50, SCREEN_WIDTH, self.dataArray.count*[self tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]);
        self.scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-75+CGRectGetHeight(self.tableView.frame));
    } else {
        self.scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-75);
    }
}

#pragma mark Target Methods
- (void)selectDate {
    
    NSLog(@"select date");
}

- (void)searchForBuses {
    NSLog(@"Searching for buses...");
    
    [self.scrollview setContentOffset:CGPointZero];
    self.scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-75);
    self.tableView.hidden = YES;
    
    if (self.txtFrom.text.length == 0 || self.txtTo.text.length == 0) {
        
    } else {
        
        NSDictionary *detailsdict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:self.txtFrom.text,self.txtTo.text,, nil] forKeys:@"FromPoint",@"ToPoint",@"Date",nil];
        
        self.tableView.hidden = NO;
        [self.txtFrom resignFirstResponder];
        [self.txtTo resignFirstResponder];
        
        self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.btnSearch.frame)+50, SCREEN_WIDTH, self.dataArray.count*[self tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]);
        self.scrollview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-75+CGRectGetHeight(self.tableView.frame));
        
        [self layoutSubviews];
        [self.tableView reloadData];
        [self.scrollview setContentOffset:CGPointMake(0, self.tableView.frame.origin.y) animated:YES];
    }
}

#pragma mark UITextFieldDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.txtFrom) {
        [self.txtTo becomeFirstResponder];
    } else {
        [self.txtTo resignFirstResponder];
        [self selectDate];
    }
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:[HistoryCell reuseIdentifier] forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    return cell;
}

#pragma mark  - reload Table Data

- (void)reloadTableData:(NSArray *)dataArray {
    self.dataArray = dataArray;
    __weak PlanView *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
}

@end
