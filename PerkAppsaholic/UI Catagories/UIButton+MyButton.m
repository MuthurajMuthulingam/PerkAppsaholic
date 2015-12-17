//
//  UIButton+MyButton.m
//  GeneralTemplate
//
//  Created by Muthuraj Muthulingam on 10/18/15.
//  Copyright © 2015 Muthuraj Muthulingam. All rights reserved.
//

#import "UIButton+MyButton.h"

@implementation UIButton (MyButton)

- (instancetype)initWithFrame:(CGRect)frame andTitleText:(NSString *)titleString titleColor:(UIColor *)titleColor image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:titleString forState:UIControlStateNormal];
        [self setTitle:titleString forState:UIControlStateSelected];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateSelected];
        [self setImage:image forState:UIControlStateNormal];
        [self setImage:selectedImage forState:UIControlStateSelected];

    }
    return self;
}

@end
