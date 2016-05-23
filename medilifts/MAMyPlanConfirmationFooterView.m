//
//  MAMyPlanConfirmationFooterView.m
//  MyAirtel
//
//  Created by Saurabh on 11/4/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import "MAMyPlanConfirmationFooterView.h"
#import "MAUtility.h"
#import "MLStyle.h"

@implementation MAMyPlanConfirmationFooterView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
        self.sendButton = [WPTextButton buttonWithType:UIButtonTypeSystem];
        self.sendButton.bgColor = kBlueColor;
//        [self.sendButton setTitle:MALocalisedStringForKey(@"send") forState:UIControlStateNormal];
        [self.sendButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_sendButton];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame withButtonTitle:(NSString *)buttnTitle{
    
    self = [super initWithFrame:frame];
    if(self){
        
        self.sendButton = [WPTextButton buttonWithType:UIButtonTypeSystem];
        self.sendButton.bgColor = kBlueColor;
        [self.sendButton setTitle:buttnTitle forState:UIControlStateNormal];
        [self.sendButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_sendButton];
    }
    return self;

}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGRect rect = self.bounds;

    CGSize size = [self.sendButton sizeForButton];
    self.sendButton.frame = CGRectMake(floorf((rect.size.width - size.width)/2.0), 2.0 * kRechargeContentInset, size.width, size.height);
    
}

+(float)requiredHeightForWidth:(float)width{
    
    return 44 + 3.0 * kRechargeContentInset;
}

@end
