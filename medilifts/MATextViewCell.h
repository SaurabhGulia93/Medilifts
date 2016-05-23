//
//  MATextViewCell.h
//  MyAirtel
//
//  Created by Nidhi Goyal on 7/1/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MATextView;

@interface MATextViewCell : UITableViewCell

@property (nonatomic, strong) MATextView *textView;

+ (float)requiredHeight;

- (void)updateTitleWithText:(NSString *)text forWidth:(CGFloat)width;
@end
