//
//  CALayer+UIoperation.m
//  Cash_Register
//
//  Created by Yinhuan Yuan on 4/30/19.
//  Copyright © 2019 Jun Dang. All rights reserved.
//

#import "CALayer+UIoperation.h"

@implementation CALayer (UIoperation)
@dynamic borderNewColor, borderNewWidth, cornerNewRadius;

-(void)setBorderNewColor:(UIColor *)color {
    [self setBorderColor: color.CGColor];
}

-(void)setBorderNewWidth:(CGFloat)borderWidth {
    [self setBorderWidth:borderWidth];
};

-(void)setCornerNewRadius:(CGFloat)cornerNewRadius {
    [self setCornerRadius:cornerNewRadius];
}

@end
