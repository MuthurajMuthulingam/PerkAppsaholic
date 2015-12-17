//
//  UILabel+MyLabel.h
//  GeneralTemplate
//
//  Created by Muthuraj Muthulingam on 10/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MyLabel)

- (instancetype)initWithFrame:(CGRect)frame andText:(NSString *)textString andTextColor:(UIColor *)textColor andFont:(UIFont *)textFont textAlignments:(NSTextAlignment)textAlignment;

@end
