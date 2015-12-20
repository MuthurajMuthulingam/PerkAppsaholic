//
//  HistoryCell.h
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

@interface HistoryCell : UITableViewCell

@property (nonatomic, strong) UILabel *lblFromTo;
@property (nonatomic, strong) UILabel *lblTime;
@property (nonatomic, strong) UILabel *lblName;
@property (nonatomic, strong) UILabel *lblDate;
@property (nonatomic, strong) UILabel *lblYear;
@property (nonatomic, strong) UILabel *lblPerkPoints;

@property (nonatomic) NSInteger rewardPoints;

+ (NSString *)reuseIdentifier;
- (void)updateCellWithData:(NSDictionary *)dataDictionary;
@end
