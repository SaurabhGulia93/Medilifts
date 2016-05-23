//
//  MAMyPlanConfirmationFooterView.h
//  MyAirtel
//
//  Created by Saurabh on 11/4/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPTextButton.h"

@interface MAMyPlanConfirmationFooterView : UIView

@property (nonatomic, strong) WPTextButton *sendButton;

-(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame withButtonTitle:(NSString *)buttnTitle;
+(float)requiredHeightForWidth:(float)width;
@end
