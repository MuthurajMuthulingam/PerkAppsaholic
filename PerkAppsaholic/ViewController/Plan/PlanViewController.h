//
//  PlanViewController.h
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

@protocol planViewControllerDelegate <NSObject>

- (void)addPoints;

@end

@interface PlanViewController : UIViewController

@property (nonatomic, weak) id <planViewControllerDelegate> delegate;

@end
