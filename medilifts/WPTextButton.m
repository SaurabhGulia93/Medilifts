//
//  WPButton.m
//  WynkPay
//
//  Created by Neetika Mittal on 19/12/14.
//  Copyright (c) 2014 App Street Software Pvt. Ltd. All rights reserved.
//

#import "WPTextButton.h"
#import "MLStyle.h"

@interface WPTextButton ()
{
    float _textOffset;
}

@end

@implementation WPTextButton

+ (id)buttonWithType:(UIButtonType)buttonType
{
    WPTextButton *aButton = [super buttonWithType:buttonType];
    [aButton setup];
    return aButton;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _textOffset = 1.0;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.3] forState:UIControlStateDisabled];
//    self.titleLabel.font = kMainTextButtonFont;
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = kItemCornerRadius;
    self.clipsToBounds = YES;
}

- (CGSize)sizeForButton
{
    NSString *text = [self titleForState:UIControlStateNormal];
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGSize size = CGSizeZero;
    
    if (text && ![text isEqualToString:@""]) {
        size = [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
        size.width = ceil(size.width);
        size.height = ceil(size.height);
        size = (CGSize) {size.width + ((self.hasSmallerPadding) ? kMainTextButtonPadding/2 : 2.0 * kMainTextButtonPadding), size.height};
    }
    else if (image) {
        size = image.size;
    }
    
    size.width = MAX(size.width, kMainTextButtonMinWidth);
    size.height = MAX(size.height, kMainTextButtonHeight);
    return size;
}

- (CGSize)originalSizeForButton
{
    NSString *text = [self titleForState:UIControlStateNormal];
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGSize size = CGSizeZero;
    
    if (text && ![text isEqualToString:@""]) {
        size = [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
        size.width = ceil(size.width);
        size.height = ceil(size.height);
        size = (CGSize) {size.width + ((self.hasSmallerPadding) ? kMainTextButtonPadding/2 : 2.0 * kMainTextButtonPadding), size.height};
    }
    else if (image) {
        size = image.size;
    }
    
    size.width += 2*kDefaultPadding;
    size.height += 2*kDefaultPadding;
    return size;
}

- (CGSize)smallSizeForButton
{
    NSString *text = [self titleForState:UIControlStateNormal];
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGSize size = CGSizeZero;
    
    if (text && ![text isEqualToString:@""]) {
        size = [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
        size.width = ceil(size.width);
        size.height = ceil(size.height);
    }
    else if (image) {
        size = image.size;
    }
    
    size.width += 2*kDefaultPadding;
    size.height += 2*kDefaultPadding;
    return size;
}


- (CGSize)intrinsicContentSize
{
    CGSize size = [super intrinsicContentSize];
    size = (CGSize) {size.width + ((self.hasSmallerPadding) ? kMainTextButtonPadding/2 : 2.0 * kMainTextButtonPadding), size.height};

    size.width = MAX(size.width, kMainTextButtonMinWidth);
    size.height = MAX(size.height, kMainTextButtonHeight);
    return size;
}

- (void)setFrame:(CGRect)frame
{
    frame = CGRectInset(frame, -2.0, -2.0);
    [super setFrame:frame];
}

- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if (!_bgColor) {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.bgColor.CGColor);
    
    rect = CGRectInset(rect, 2.0, 2.0);
    
    CGContextSetShadowWithColor(context, (CGSize) {0.0, 0.0}, 1.0, [UIColor colorWithWhite:0.0 alpha:0.25].CGColor);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:kItemCornerRadius];
    CGContextAddPath(context, path.CGPath);
    CGContextFillPath(context);
}

//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    UIImage *image = [self imageForState:UIControlStateNormal];
//    if (!image) {
//        return CGRectZero;
//    }
//    
//    CGSize titleSize = [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
//
//    CGSize size = image.size;
//    return (CGRect) {self.havingImageOnRight ? (contentRect.size.width - titleSize.width)/2 + titleSize.width : kTickButtonInternalPadding/2, floor((contentRect.size.height - size.height)/2.0), size};
//}
//
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    UIImage *image = [self imageForState:UIControlStateNormal];
//    if (!image) {
//        return contentRect;
//    }
//    
//    CGSize titleSize = [[self titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
//
//    CGSize size = image.size;
//    float left = self.havingImageOnRight ? (contentRect.size.width - titleSize.width)/2 : size.width > 0.0f ? (size.width + 0.75*kTickButtonInternalPadding) : 0.0f;
//    float w = titleSize.width;
//    
//    CGRect tRect = contentRect;
//    tRect.origin.x = left;
//    tRect.origin.y = floor((contentRect.size.height - titleSize.height)/2);
//    tRect.size.height = titleSize.height;
//    tRect.size.width = w;
//    return tRect;
//}

@end
