//
//  MAReferFriendFooterView.m
//  MyAirtel
//
//  Created by Saurabh on 12/1/15.
//  Copyright © 2015 IgniteWorld. All rights reserved.
//

#import "MAReferFriendFooterView.h"
#import "MAConstants.h"
#import "MAUtility.h"
#import "MLStyle.h"

#define defaultButtonHeight 44
#define buttonWidth 110
#define noOfButtons 4

@interface MAReferFriendFooterView()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIView *optionsView;
@property (nonatomic, strong) NSArray *optionsButtonArray;
@property (nonatomic, strong) NSArray *optionsLabelArray;

@end

@implementation MAReferFriendFooterView

-(instancetype)initWithFrame:(CGRect)frame withOptions:(NSArray *)optionArray{
    
    self = [super initWithFrame:frame];
    if(self){
        
        [self setUp];
    }
    return self;
}

-(void)setUp{

    self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.containerView.backgroundColor = GRAY(0.9);
    [self addSubview:self.containerView];
 
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.textLabel.numberOfLines = 0;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self.textLabel setAttributedText:[self getTextLabelAttrText]];
    [self.containerView addSubview:self.textLabel];
    
    self.optionsView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.containerView addSubview:self.optionsView];
    
    NSArray *imagArr = @[@"fb",@"twitter",@"google",@"insta"];
    NSArray *labelArr = @[@"Facebook",@"Twitter",@"Google+",@"Instagram"];
    NSMutableArray *buttonArr = [[NSMutableArray alloc] init];
    NSMutableArray *labelArray = [[NSMutableArray alloc] init];
    for(NSInteger i = 0; i<noOfButtons; i++){
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = i+1;
        [button addTarget:self action:@selector(optionsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:[imagArr objectAtIndex:i]] forState:UIControlStateNormal];
        [buttonArr addObject:button];
        [self.optionsView addSubview:button];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.attributedText = [self getOptionsLabelAttrText:[labelArr objectAtIndex:i]];
        [labelArray addObject:label];
        [self.optionsView addSubview:label];
    }
    
    self.optionsButtonArray = [NSArray arrayWithArray:buttonArr];
    self.optionsLabelArray = [NSArray arrayWithArray:labelArray];

//        [self backGroundColors];
}


-(void)backGroundColors{

    self.backgroundColor = [UIColor brownColor];
    self.containerView.backgroundColor = [UIColor yellowColor];
    self.optionsView.backgroundColor = [UIColor blueColor];
    self.textLabel.backgroundColor = [UIColor brownColor];
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGRect frame = self.bounds;
    self.containerView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    float x = kRechargeContentInset;
    float y = kTransactionHistoryCellVerticalPadding;
    float availableWidth = frame.size.width - 2.0 * x;
    
    CGSize textLabelSize = [MAUtility sizeForAttributedString:self.textLabel.attributedText width:availableWidth];
    self.textLabel.frame = CGRectMake(x, y, availableWidth, textLabelSize.height);
    
    float optionsLabelWidth = availableWidth/noOfButtons;
    float diameter = availableWidth/noOfButtons - 2.0 * kRechargeContentInset;
    float optionsViewH = diameter + 2.0 * kRechargeContentInset;
    
    y += self.textLabel.frame.size.height;
    self.optionsView.frame = CGRectMake(x, y, availableWidth, optionsViewH);
    
    y = kRechargeContentInset;
    float labelX = 0;
    for(NSInteger i = 0; i<noOfButtons; i++){
        
        UIButton *button = [self.optionsButtonArray objectAtIndex:i];
        button.frame = CGRectMake(x, y, diameter, diameter);
        button.layer.cornerRadius = diameter/2;
        button.layer.masksToBounds = YES;
        
        UILabel *label = [self.optionsLabelArray objectAtIndex:i];
        CGSize labelSize = [MAUtility sizeForAttributedString:label.attributedText width:optionsLabelWidth];
        label.frame = CGRectMake(labelX, y + diameter + kTransactionHistoryCellVerticalPadding, optionsLabelWidth, labelSize.height);
        
        labelX += optionsLabelWidth;
        x += diameter + 2.0 * kRechargeContentInset;
    }
}

-(float)requiredHeightForWidth:(float)width{
    
    float height = 0.0;
    
    float x = kRechargeContentInset;
//    float y = kTransactionHistoryCellVerticalPadding;
    float availableWidth = width - 2.0 * x;
    
    CGSize textLabelSize = [MAUtility sizeForAttributedString:self.textLabel.attributedText width:availableWidth];
    float diameter = availableWidth/noOfButtons - 2.0 * kRechargeContentInset;
    
    float labelH = 0.0f;
    for(NSInteger i = 0; i<noOfButtons; i++){
        
        UILabel *label = [self.optionsLabelArray objectAtIndex:i];
        CGSize labelSize = [MAUtility sizeForAttributedString:label.attributedText width:diameter];
        labelH = MAX(labelH, labelSize.height);
    }
    
    float optionsViewH = diameter + 2.0 * kRechargeContentInset + labelH + 1.0 * kTransactionHistoryCellVerticalPadding;
    
    height = textLabelSize.height + optionsViewH;
    return height;
}

-(void)optionsButtonTapped:(UIButton *)sender{
    
    if([_delegate respondsToSelector:@selector(didTapAtButtonToShare:)]){
        
        [_delegate didTapAtButtonToShare:sender.tag];
    }
}

- (NSAttributedString *)getTextLabelAttrText
{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] init];
    
    NSDictionary *headerTitleDict1 = @{NSFontAttributeName : MEDIUM(18),
                                       NSForegroundColorAttributeName : GRAY(0.3),
                                       NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
                                       };
    
    NSAttributedString *headerAttr1 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",@"Contact Us"] attributes:headerTitleDict1];
    [attStr appendAttributedString:headerAttr1];
    return [[NSAttributedString alloc] initWithAttributedString:attStr];
}

- (NSAttributedString *)getOptionsLabelAttrText:(NSString *)text
{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] init];
    
    NSDictionary *headerTitleDict1 = @{NSFontAttributeName : LIGHT(12),
                                       NSForegroundColorAttributeName : kDarkerGrayFontColor
                                       };
    
    NSAttributedString *headerAttr1 = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",text] attributes:headerTitleDict1];
    [attStr appendAttributedString:headerAttr1];
    return [[NSAttributedString alloc] initWithAttributedString:attStr];
}



@end
