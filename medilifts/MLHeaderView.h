//
//  MLHeaderView.h
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLHeaderView : UIView

-(instancetype)initWithFrame:(CGRect)frame imageName1:(NSString *)imageName1 imageName12:(NSString *)imageName2 attributedString1:(NSAttributedString *)attrStr1 attributedString2:(NSAttributedString *)attrStr2;

-(float)requireHeightForWidht:(float)width attributedString1:(NSAttributedString *)attrStr1 attributedString2:(NSAttributedString *)attrStr2;

@property (nonatomic, assign) BOOL changeImageSize;


@end
