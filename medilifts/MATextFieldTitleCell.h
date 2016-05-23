//
//  MATextFieldTitleCell.h
//  MyAirtel
//
//  Created by Shubham Mandal on 22/04/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MATextField.h"
#import "MAConstants.h"

@interface MAPhoneNumberLabel : UILabel

@end

@interface MATextFieldTitleCell : UITableViewCell

@property (nonatomic, strong) MATextField *tf;
@property (nonatomic, readonly) MATextField *textField;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIButton *rightView;
@property (nonatomic, strong) MAPhoneNumberLabel *leftView;

@property (nonatomic, assign) BOOL enabledClaimOffersTF;
@property (nonatomic, assign) BOOL havingMandatoryField;
@property (nonatomic, assign) BOOL isLoading;

+ (CGFloat)heightForWidth:(CGFloat)width withTitleText:(NSString *)text;
+ (CGFloat)heightForWidth:(CGFloat)width withTitleText:(NSString *)text mode:(MATFTitleMode)mode;

- (void)updateTitleWithText:(NSString *)text forWidth:(CGFloat)width;
- (void)updateTitleWithText:(NSString *)text forWidth:(CGFloat)width mode:(MATFTitleMode)mode;
- (void)shouldShowRightViewWithImage:(UIImage *)image;
- (void)shouldShowRightViewWithImage:(UIImage *)image withRenderingMode:(UIImageRenderingMode)mode;
- (void)shouldShowRightViewWithText:(NSString *)text;
- (void)shouldShowLeftViewWithData:(NSString *)str;

- (void)disableTf:(BOOL)disable;
- (void)enableIWTMode;
- (void)centerCursor;

- (void)setPreFilledTFText:(NSString *)preFilledTFText;
- (void)setEnabledClaimOffersTF:(BOOL)enabledClaimOffersTF;
- (void)setTfTextColor:(UIColor *)tfTextColor;

@end
