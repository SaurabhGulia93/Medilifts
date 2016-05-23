//
//  MACustomLabel.m
//  MyAirtel
//
//  Created by Nishit Sharma on 3/25/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import "MATextView.h"
#import "MLStyle.h"
#import "MAUtility.h"

@interface MATextView () {
    UILabel *placeholderLabel;
    BOOL _hidePlaceholder;
}

@end

@implementation MATextView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        float inset = round(kTFTitleTextFieldHeight/4.0);
        self.textContainerInset = (UIEdgeInsets) {inset, inset, inset, inset};
        self.textContainer.lineFragmentPadding = 0;
        
        self.tintColor = kCustomCyanColor;
        self.backgroundColor = kOffWhiteColor;
        self.layer.cornerRadius = kItemCornerRadius;
        
        self.font = kTextFieldFont;
        self.textColor = kBlackFontColor;
        
        [self updateBorderColors];
        
        [self initCommon];
    }
    return self;
}

- (BOOL)becomeFirstResponder
{
    BOOL val = [super becomeFirstResponder];
    [self updateBorderColors];
    return val;
}

- (BOOL)resignFirstResponder
{
    BOOL val = [super resignFirstResponder];
    [self updateBorderColors];
    return val;
}

- (void)setIsInvalid:(BOOL)isInvalid
{
    if (_isInvalid == isInvalid) {
        return;
    }
    
    _isInvalid = isInvalid;
    [self updateBorderColors];
}

- (void)setHidesBorder:(BOOL)hidesBorder
{
    if (_hidesBorder == hidesBorder) {
        return;
    }
    
    _hidesBorder = hidesBorder;
    [self updateBorderColors];
}

- (void)updateBorderColors
{
    if (_hidesBorder) {
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 0.0;
        return;
    }
    
    if ([self isFirstResponder]) {
        self.layer.borderColor = kCustomCyanColor.CGColor;
        self.layer.borderWidth = 1.0;
    }
    else if (_isInvalid) {
        self.layer.borderColor = kRedColor.CGColor;
        self.layer.borderWidth = 1.0;
    }
    else if (_hidesBorder) {
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 0.0;
    }
    else {
        self.layer.borderColor = kThinOutlineTransparentColor.CGColor;
        self.layer.borderWidth = 1.0/ [UIScreen mainScreen].scale;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_hidePlaceholder && [placeholderLabel superview]) {
        [placeholderLabel removeFromSuperview];
    }
    else if (!_hidePlaceholder && [self.placeholderText length] > 0)
        [self showPlaceholder];
}


- (void)showPlaceholder {
    if (![self hasText] && ![placeholderLabel superview]) {
        CGSize size = [MAUtility sizeForString:self.placeholderText font:self.font];
        CGRect frame = CGRectMake(kTextViewInset, kTextViewInset, self.bounds.size.width, size.height);
        placeholderLabel.frame = frame;
        placeholderLabel.text = self.placeholderText;
        [self addSubview:placeholderLabel];
    }
}

- (void)initCommon {
    if (!placeholderLabel) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beganEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endedEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
        placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.textColor = kTVPlaceholderColor;
        placeholderLabel.font = self.font;
        placeholderLabel.lineBreakMode = NSLineBreakByCharWrapping;
        placeholderLabel.textAlignment = NSTextAlignmentLeft;
        [self setNeedsLayout];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setPlaceholderText:(NSString *)newValue {
    if(!newValue)
        _hidePlaceholder = YES;
    else{
        _placeholderText = newValue;
        _hidePlaceholder = NO;
    }
    
    [self setNeedsLayout];
}

- (void)beganEditing:(NSNotification *)notification {
    _hidePlaceholder = YES;
    [self setNeedsLayout];
}

- (void)endedEditing:(NSNotification *)notification {
     _hidePlaceholder = NO;
    [self setNeedsLayout];
}



@end
