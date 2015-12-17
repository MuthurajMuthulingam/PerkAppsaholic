//
//  UIButton+MyButton.h
//  GeneralTemplate
//
//  Created by Muthuraj Muthulingam on 10/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MyButton)

- (instancetype)initWithFrame:(CGRect)frame andTitleText:(NSString *)titleString titleColor:(UIColor *)titleColor image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@end
