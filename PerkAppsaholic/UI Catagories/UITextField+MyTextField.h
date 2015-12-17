//
//  UITextField+MyTextField.h
//  GeneralTemplate
//
//  Created by Muthuraj Muthulingam on 10/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITextField (MyTextField)

- (instancetype)initWithFrame:(CGRect)frame andText:(NSString *)textString font:(UIFont *)textFont textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
