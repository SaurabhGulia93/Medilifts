//
//  MLTabBarControllerViewController.h
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLTabBarControllerViewController : UIViewController <UITabBarDelegate>

@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, retain) UITabBar *tabBar;
@property (nonatomic, retain) UIViewController *selectedViewController;
@property (nonatomic, assign) NSInteger *selectedIndex;

@end
