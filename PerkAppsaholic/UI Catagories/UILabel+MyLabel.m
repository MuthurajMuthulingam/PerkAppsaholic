//
//  UILabel+MyLabel.m
//  GeneralTemplate
//
//  Created by Muthuraj Muthulingam on 10/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "UILabel+MyLabel.h"

@implementation UILabel (MyLabel)

- (instancetype)initWithFrame:(CGRect)frame andText:(NSString *)textString andTextColor:(UIColor *)textColor andFont:(UIFont *)textFont textAlignments:(NSTextAlignment)textAlignment{
    self = [super initWithFrame:frame];
    if (self) {
        self.text = textString;
        self.textAlignment = textAlignment;
        self.textColor = textColor;
        self.font = textFont;
    }
    return self;
}

@end
