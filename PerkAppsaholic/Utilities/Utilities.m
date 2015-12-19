//
//  Utilities.m
//  PerkAppsaholic
//
//  Created by Chandra@F22 on 19/12/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "Utilities.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation Utilities

+ (UIFont *)regularFontHeaderOne {
    
    return [UIFont systemFontOfSize:18.0 weight:UIFontWeightRegular];
}

+ (UIFont *)regularFontHeaderTwo {
    
    return [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
}

+ (UIFont *)regularFontHeaderThree {
    
    return [UIFont systemFontOfSize:12.0 weight:UIFontWeightRegular];
}

+ (UIFont *)regularFontHeaderFour {
    
    return [UIFont systemFontOfSize:10.0 weight:UIFontWeightRegular];
}

+ (UIFont *)regularFontofSize:(CGFloat)size {
    return [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
}

+ (void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"From and To should not be blank."
                                                    message:@"You must choose a place to start your journey and a destination."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (NSString *)getDateStringFromDate:(NSDate *)date {
    if (date) {
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy-MM-dd"];
        return [formater stringFromDate:date];
    }
    return nil;
}
@end
