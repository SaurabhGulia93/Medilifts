//
//  MATextViewCell.m
//  MyAirtel
//
//  Created by Nidhi Goyal on 7/1/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import "MATextViewCell.h"
#import "MATextView.h"
#import "MLStyle.h"
#import "MAUtility.h"

@interface MATextViewCell ()
{
    CGFloat _tfWidth;
}
@property (nonatomic, strong) UILabel *maxCharactersLabel;
@end

@implementation MATextViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _tfWidth = kLOBBigContentWidth;
    
    _textView = [[MATextView alloc] initWithFrame:CGRectZero];
    _textView.keyboardType = UIKeyboardTypeASCIICapable;
    _textView.font = kTableViewPGRegFontSize;
    _textView.textColor = kBlackFontColor;
    [self.contentView addSubview:self.textView];
    
    self.maxCharactersLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.maxCharactersLabel.numberOfLines = 0;
//    self.maxCharactersLabel.text = @"Min 25 characters";
    self.maxCharactersLabel.font = kBalanceArrowFont;
    self.maxCharactersLabel.textColor = kDarkerGrayFontColor;
    [self.contentView addSubview:self.maxCharactersLabel];
    

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat width = self.contentView.bounds.size.width;
    
    float x = MACenteredOrigin(width, _tfWidth);
    [self.textView setFrame:(CGRect){x, kTableViewSmallPadding, _tfWidth, kP2PTextViewHeight}];
    
    
    CGFloat margin = (width - _tfWidth) / 2.0;
    
    CGSize maxCharactersLabelSize = self.maxCharactersLabel.intrinsicContentSize;
    self.maxCharactersLabel.frame = (CGRect) {width - maxCharactersLabelSize.width - margin, CGRectGetMaxY(self.textView.frame),  maxCharactersLabelSize.width, kAddNoteMaxCharLabelHeight};
}



+ (float)requiredHeight
{
    return kP2PTextViewHeight + kTableViewSmallPadding + kAddNoteMaxCharLabelHeight;
}

- (void)updateTitleWithText:(NSString *)text forWidth:(CGFloat)width
{
    _tfWidth = width;
    _textView.text = text;
    [self setNeedsLayout];
}

@end
