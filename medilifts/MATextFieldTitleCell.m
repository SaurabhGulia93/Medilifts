//
//  MATextFieldTitleCell.m
//  MyAirtel
//
//  Created by Shubham Mandal on 22/04/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import "MATextFieldTitleCell.h"
#import "MAUtility.h"
#import "MLStyle.h"

@implementation MAPhoneNumberLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect inRect = self.bounds;
    CGFloat rounding = kItemCornerRadius;

    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:inRect byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(rounding, rounding)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end

@interface MATextFieldTitleCell ()
{
    CGFloat _tfWidth;
    MATFTitleMode _mode;
}

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UILabel * starLabel;


@end

@implementation MATextFieldTitleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        _tf = [[MATextField alloc] initWithFrame:CGRectZero];
        _tf.textAlignment = NSTextAlignmentLeft;
        _tf.keyboardType = UIKeyboardTypeNumberPad;
        [self.contentView addSubview:_tf];
        
        self.havingMandatoryField = NO;
        _starLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _starLabel.textAlignment = NSTextAlignmentCenter;
        _starLabel.textColor = kRedColor;
        _starLabel.font = kTFBigTitleFont;
        _starLabel.text = @"*";
        [self.contentView addSubview:_starLabel];
        
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.font = kTFTitleFont;
        _title.textColor = kBlackFontColor;
        _title.textAlignment = NSTextAlignmentLeft;
        _title.contentMode = UIViewContentModeLeft;
        _title.numberOfLines = 0;
        [self.contentView addSubview:_title];
        
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectZero];
        self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        self.activityIndicator.hidden = YES;
        [self.contentView addSubview:_activityIndicator];
    }
    return self;
}

- (void)enableIWTMode
{
    _mode = MATFTitleModeIWT;
    
    _tf.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    _tf.isPointerHidden = YES;
    _tf.font = kTableViewPGRegFontSize;
    
    _title.font = kTFIWTTitleFont;
    _title.textColor = kDarkerGrayFontColor;
}

- (void)centerCursor
{
    if (self.tf.textAlignment != NSTextAlignmentCenter) {
        return;
    }

    if (self.rightView) {
        self.tf.rightViewMode = UITextFieldViewModeNever;
    }
    else {
        self.tf.rightView = [[UIView alloc] initWithFrame:self.leftView.frame];
        self.tf.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize size = self.contentView.bounds.size;
    
    self.separatorInset = (UIEdgeInsets) {0.0, size.width, 0.0, 0.0};

    float y = kTableViewLargePadding;
    
    if (_mode != MATFTitleModeNoTitle) {
        CGSize tSize = [MAUtility sizeForString:_title.text font:_title.font width:_tfWidth - 2 * kTableViewSmallPadding];
        float x = MACenteredOrigin(size.width, _tfWidth);
        _title.frame = (CGRect) {x, y, tSize};
        
        if (_mode == MATFTitleModeDefault || _mode == MATFTitleModeIWT || _mode == MAREferCodeEnterScreen) {
            y += kTFTitleAndFieldPadding + tSize.height;
        }
        else if (_mode == MATFTitleModeBigTitle) {
            y += kTableViewLargePadding + tSize.height;
        }
    }
    else {
        y = kTableViewSmallPadding;
    }
    
    float x = MACenteredOrigin(size.width, _tfWidth);
    
    _tf.frame = CGRectMake(x, y, _tfWidth, kTFTitleTextFieldHeight);
    
    if(self.havingMandatoryField)
        _starLabel.frame = CGRectMake(_tf.frame.origin.x + _tf.bounds.size.width, y, (size.width - (_tf.frame.origin.x + _tf.bounds.size.width)), kTFTitleTextFieldHeight);
    else
        _starLabel.frame = CGRectZero;

    CGSize imgSize = CGSizeZero;
    if ([self.rightView imageForState:UIControlStateNormal])
    {
        imgSize = [self.rightView imageForState:UIControlStateNormal].size;
    }
    else if ([self.rightView titleColorForState:UIControlStateNormal])
    {
        imgSize = [MAUtility sizeForString:self.rightView.titleLabel.text font:self.rightView.titleLabel.font];
    }
    CGFloat padding = floorf((kTFTitleTextFieldHeight - imgSize.height)/2.0);
    CGRect rightViewRect = (CGRect){CGRectGetMaxX(_tf.frame) - imgSize.width - padding, CGRectGetMinY(self.tf.frame) + padding, imgSize};
    self.rightView.frame = CGRectInset(rightViewRect, -padding, -padding);
    
    
    CGSize strSize = [MAUtility sizeForString:self.leftView.text font:self.leftView.font width:_tf.bounds.size.width];
    padding = floorf((kTFTitleTextFieldHeight - strSize.height)/2.0);
    CGRect leftViewRect = (CGRect){0.0, 0.0, strSize.width + padding, kTFTitleTextFieldHeight};
    self.leftView.frame = leftViewRect;
    
    CGFloat w = CGRectGetWidth(self.activityIndicator.frame);
    CGFloat h = CGRectGetHeight(self.activityIndicator.frame);
    CGFloat p = floorf((kTFTitleTextFieldHeight - h)/2.0);
    self.activityIndicator.frame = (CGRect) {CGRectGetMaxX(_tf.frame) - p - w, CGRectGetMinY(self.tf.frame) + p, w, h};

    [self centerCursor];
}

+ (CGFloat)heightForWidth:(CGFloat)width withTitleText:(NSString *)text
{
    return [self heightForWidth:width withTitleText:text mode:MATFTitleModeDefault];
}

+ (CGFloat)heightForWidth:(CGFloat)width withTitleText:(NSString *)text mode:(MATFTitleMode)mode
{
    if (mode == MATFTitleModeIWT) {
        float height = kTableViewLargePadding;
        CGSize tSize = [MAUtility sizeForString:text font:kTFIWTTitleFont width:width - 2 * kTableViewSmallPadding];
        height += tSize.height + kTFTitleAndFieldPadding + kTFTitleTextFieldHeight;
        return height;
    }
    else if (mode == MATFTitleModeBigTitle) {
        float height = kTableViewLargePadding * 2.0;
        CGSize tSize = [MAUtility sizeForString:text font:kTFBigTitleFont width:width - 2 * kTableViewSmallPadding];
        height += tSize.height + kTFTitleTextFieldHeight;
        return height;
    }
    else if (mode == MATFTitleModeNoTitle) {
        return kTableViewMediumPadding + kTFTitleTextFieldHeight;
        
    }else if (mode == MAREferCodeEnterScreen){
        
        float height = kTableViewLargePadding;
        CGSize tSize = [MAUtility sizeForString:text font:kReferTitleFont width:width - 2 * kTableViewSmallPadding];
        height += tSize.height + kTFTitleAndFieldPadding + kTFTitleTextFieldHeight;
        return height;
        
    }
    else {
        float height = kTableViewLargePadding;
        CGSize tSize = [MAUtility sizeForString:text font:kTFTitleFont width:width - 2 * kTableViewSmallPadding];
        height += tSize.height + kTFTitleAndFieldPadding + kTFTitleTextFieldHeight;
        return height;
    }
}

- (MATextField*)textField
{
    return self.tf;
}

- (void)updateTitleWithText:(NSString *)text forWidth:(CGFloat)width mode:(MATFTitleMode)mode
{
    if (mode == MATFTitleModeIWT) {
        return;
    }
    
    _mode = mode;
    if (_mode == MATFTitleModeBigTitle) {
        _title.font = kTFBigTitleFont;
    }else if (_mode == MAREferCodeEnterScreen){
        _title.font = kReferTitleFont;
    }
    else {
        _title.font = kTFTitleFont;
    }
    
    [self updateTitleWithText:text forWidth:width];
}

- (void)updateTitleWithText:(NSString *)text forWidth:(CGFloat)width
{
    _tfWidth = width;
    _title.text = text;
    [self setNeedsLayout];
}

- (void)shouldShowRightViewWithImage:(UIImage *)image
{
    [self shouldShowRightViewWithImage:image withRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (void)shouldShowRightViewWithImage:(UIImage *)image withRenderingMode:(UIImageRenderingMode)mode
{
    if (image) {
        if (!self.rightView) {
            image = [image imageWithRenderingMode:mode];
            self.rightView = [UIButton buttonWithType:UIButtonTypeSystem];
            self.rightView.tintColor = [UIColor grayColor];
            [self.rightView setImage:image forState:UIControlStateNormal];
            [self addSubview:_rightView];
            [self setNeedsLayout];
        }
    }
    else {
        [self.rightView removeFromSuperview];
        self.rightView = nil;
    }
}

- (void)shouldShowRightViewWithText:(NSString *)text
{
    if (text) {
        if (!self.rightView) {
            self.rightView = [UIButton buttonWithType:UIButtonTypeSystem];
            [self.rightView setTitle:text forState:UIControlStateNormal];
            [self.rightView setTitleColor:kCustomCyanColor forState:UIControlStateNormal];
            self.rightView.titleLabel.font = kCouponMerchantFont;
            [self addSubview:_rightView];
            [self setNeedsLayout];
        }
    }
    else {
        [self.rightView removeFromSuperview];
        self.rightView = nil;
    }
}


- (void)shouldShowLeftViewWithData:(NSString *)str
{
    if (str) {
        if (!self.leftView) {
            self.leftView = [[MAPhoneNumberLabel alloc] initWithFrame:CGRectZero];
            self.leftView.backgroundColor = RGB(222.0, 222.0, 222.0);
//            self.leftView.layer.cornerRadius = kItemCornerRadius;
            self.leftView.layer.masksToBounds = YES;
            self.leftView.font = kTableViewPGRegFontSize;
            self.leftView.textColor = [UIColor blackColor];
            self.leftView.textAlignment = NSTextAlignmentLeft;
//            self.leftView.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
//            self.leftView.layer.borderColor = kThinOutlineTransparentColor.CGColor;
            self.leftView.text = str;
            [self.tf setLeftView:_leftView];
            self.tf.leftViewMode = UITextFieldViewModeAlways;
            [self setNeedsLayout];
        }
    }
    else {
        [self.leftView removeFromSuperview];
        self.leftView = nil;
    }
}

- (void)setIsLoading:(BOOL)isLoading
{
    _isLoading = isLoading;
    if (isLoading) {
        self.rightView.hidden = YES;
        self.activityIndicator.hidden = NO;
        [self.activityIndicator startAnimating];
    }
    else {
        self.rightView.hidden = NO;
        self.activityIndicator.hidden = YES;
        [self.activityIndicator stopAnimating];
    }
}

- (void)disableTf:(BOOL)disable
{
    self.tf.textColor = (disable) ? kLightGrayColor : kBlackFontColor;
    [self.tf setEnabled:!disable];
    [self.rightView setEnabled:!disable];
}

#pragma mark - setters

- (void)setPreFilledTFText:(NSString *)preFilledTFText
{
    _tf.text = preFilledTFText;
}

- (void)setEnabledClaimOffersTF:(BOOL)enabledClaimOffersTF
{
    _enabledClaimOffersTF = enabledClaimOffersTF;
    _tf.enabled = enabledClaimOffersTF;
}

- (void)setTfTextColor:(UIColor *)tfTextColor
{
    _tf.tfColor = tfTextColor;
}

@end
