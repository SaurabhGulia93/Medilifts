//
//  MAProgessView.h
//  MyAirtel
//
//  Created by Amit Gupta on 23/02/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAProgessView : UIView

+ (void)showProgressViewInWindow:(UIWindow *)window animated:(BOOL)animated withTitle:(NSString *)title;
+ (void)hideProgressViewInWindow:(UIWindow *)window animated:(BOOL)animated;


@end
