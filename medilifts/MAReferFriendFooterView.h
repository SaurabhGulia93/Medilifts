//
//  MAReferFriendFooterView.h
//  MyAirtel
//
//  Created by Saurabh on 12/1/15.
//  Copyright © 2015 IgniteWorld. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MAReferFriendShareDelegate <NSObject>

-(void)didTapAtButtonToShare:(NSUInteger)tag;

@end

@interface MAReferFriendFooterView : UIView

@property (nonatomic, weak) id<MAReferFriendShareDelegate> delegate;
//@property (nonatomic, strong) UIButton *moreOptionsButton;

-(instancetype)initWithFrame:(CGRect)frame withOptions:(NSArray *)optionArray;
-(float)requiredHeightForWidth:(float)width;

@end
