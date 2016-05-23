//
//  MAToastView.h
//  MyAirtel
//
//  Created by Naman Singhal on 21/04/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAToast : NSObject

+ (MAToast *)shared;
- (void)showToastMessage:(NSString *)message;
-(void)dismissToast;

@end
