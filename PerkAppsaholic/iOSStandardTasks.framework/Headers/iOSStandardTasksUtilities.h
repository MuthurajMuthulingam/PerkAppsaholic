//
//  iOSStandardTasksUtilities.h
//  iOSBaseLibs
//
//  Created by Muthuraj Muthulingam on 12/15/15.
//  Copyright © 2015 Muthuraj M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iOSStandardTasksUtilities : NSObject

- (void)showLoadingMessage:(NSString *)loadingText onView:(UIView *)view;
- (void)hideLoadingMessageFromView:(UIView *)view;

@end
