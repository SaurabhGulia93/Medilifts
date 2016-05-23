//
//  WPButton.h
//  WynkPay
//
//  Created by Neetika Mittal on 19/12/14.
//  Copyright (c) 2014 App Street Software Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WPTextButton : UIButton

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, assign) BOOL hasSmallerPadding;


- (CGSize)sizeForButton;
- (CGSize)originalSizeForButton;
- (CGSize)smallSizeForButton;

@end
