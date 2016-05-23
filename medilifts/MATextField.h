//
//  MACustomLabel.h
//  MyAirtel
//
//  Created by Nishit Sharma on 3/25/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MATextField;

@protocol MATextFieldDelegate <NSObject>

@optional
- (void)textFieldDidDelete:(MATextField *)tf;

@end

@interface MATextField : UITextField

@property (nonatomic, assign) BOOL isPointerHidden;
@property (nonatomic, assign) BOOL isInvalid;
@property (nonatomic, assign) BOOL hidesBorder;
@property (nonatomic, strong) UIColor * tfColor;


@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) NSInteger previousIndex;
@property (nonatomic, assign) NSInteger nextIndex;

@property (nonatomic, assign) NSInteger offset;

@property (nonatomic, weak) id <MATextFieldDelegate> textFieldDelegate;

- (void)setTfColor:(UIColor *)tfColor;
- (void)changeTfBorderColor:(BOOL)changeBorderColor;

@end
