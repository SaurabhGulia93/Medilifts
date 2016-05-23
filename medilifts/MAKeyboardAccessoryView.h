//
//  WPKeyboardAccessoryView.h
//  WynkPay
//
//  Created by Nikhil on 12/22/14.
//  Copyright (c) 2014 BSB. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    MAAllButtons,
    MADoneButtonOnly
} MAAccessoryViewMode;

@protocol MAKeyboardAccessoryViewDelegate <NSObject>

@optional
- (void)didTapNextButton;
- (void)didTapPreviousButton;

@required
- (void)didTapDoneButton;

@end

@interface MAKeyboardAccessoryView : UIView

@property (nonatomic, weak) id <MAKeyboardAccessoryViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame andMode:(MAAccessoryViewMode)mode;

- (void)disablePrevious;
- (void)disableNext;
- (void)enableAll;
- (void)disableAll;
- (void)disablePreviousAndNext;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end
