//
//  MACustomLabel.h
//  MyAirtel
//
//  Created by Nishit Sharma on 3/25/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MATextView : UITextView

@property (nonatomic, assign) NSInteger previousIndex;
@property (nonatomic, assign) NSInteger nextIndex;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, assign) BOOL isInvalid;
@property (nonatomic, assign) BOOL hidesBorder;
@property (nonatomic, retain) NSString *placeholderText;

- (id)initWithFrame:(CGRect)frame;
@end
