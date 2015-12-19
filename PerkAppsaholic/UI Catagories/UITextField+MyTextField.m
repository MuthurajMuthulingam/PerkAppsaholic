//
//  UITextField+MyTextField.m
//  GeneralTemplate
//
//  Created by Muthuraj Muthulingam on 10/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "UITextField+MyTextField.h"

@implementation UITextField (MyTextField)

- (instancetype)initWithFrame:(CGRect)frame andText:(NSString *)textString font:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    self = [super init];
    
    if (self) {
        self.text = textString;
        self.textAlignment = textAlignment;
        self.textColor = textColor;
        self.placeholder = textString;
        self.font = textFont;
    }
    return self;
}

@end
