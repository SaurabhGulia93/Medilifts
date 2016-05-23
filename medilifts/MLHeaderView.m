//
//  MLHeaderView.m
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "MLHeaderView.h"
#import "MLStyle.h"
#import "MAUtility.h"
#import "MAConstants.h"

#define heightOfImageView 120

@interface MLHeaderView()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) NSString *imageName1;
@property (nonatomic, strong) NSString *imageName2;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) NSAttributedString *attrStr1;
@property (nonatomic, strong) NSAttributedString *attrStr2;
@end

@implementation MLHeaderView

-(instancetype)initWithFrame:(CGRect)frame imageName1:(NSString *)imageName1 imageName12:(NSString *)imageName2 attributedString1:(NSAttributedString *)attrStr1 attributedString2:(NSAttributedString *)attrStr2{
    
    self = [super initWithFrame:CGRectZero];
    if(self){
        
        self.attrStr1 = attrStr1;
        self.attrStr2 = attrStr2;
        
        self.imageName1 = imageName1;
        self.imageName2 = imageName2;
        
        self.label1 = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label1.numberOfLines = 0;
        self.label1.textAlignment = NSTextAlignmentLeft;
        [self.label1 setAttributedText:attrStr1];
        [self addSubview:_label1];
        
        self.label2 = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label2.numberOfLines = 0;
        self.label2.textAlignment = NSTextAlignmentLeft;
//        self.label2.backgroundColor = [UIColor blueColor];
        [self.label2 setAttributedText:attrStr2];
        [self addSubview:_label2];
        
        self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.imageView1 setImage:[UIImage imageNamed:imageName1]];
//        self.imageView1.backgroundColor = [UIColor blueColor];
        [self addSubview:self.imageView1];
        
        self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.imageView2 setImage:[UIImage imageNamed:imageName2]];
        [self addSubview:self.imageView2];
        
//        self.backgroundColor = [UIColor blackColor];
    
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGRect frame = self.bounds;

    float x = kTransactionHistoryCellSidePadding;
    float y = 0;
    
    float availableW = frame.size.width - 2 * x;
    
    float h = heightOfImageView * [UIScreen mainScreen].bounds.size.height/480;
    
    if(self.imageName1){
        
        self.imageView1.frame = CGRectMake(0, 0, frame.size.width, h);
        y += h + kTransactionHistoryCellVerticalPadding;
    }
    
    if(self.attrStr1){
        
        CGSize labelSize = [MAUtility sizeForAttributedString:self.attrStr1 width:availableW];
        self.label1.frame = CGRectMake(x, y, availableW, labelSize.height);
        y += labelSize.height + kRechargeContentInset;
    }
    
    if(self.imageName2){
        
        if(_changeImageSize){
            
            h -= 55;
            self.imageView2.frame = CGRectMake(0, y, frame.size.width, h);
            y += h + kTransactionHistoryCellVerticalPadding;
        }else{
            
            self.imageView2.frame = CGRectMake(0, y, frame.size.width, h);
            y += h + kTransactionHistoryCellVerticalPadding;
        }
    }
    
    if(self.attrStr2){
        
        CGSize labelSize = [MAUtility sizeForAttributedString:self.attrStr2 width:availableW];
        self.label2.frame = CGRectMake(x, y, availableW, labelSize.height);
        y += labelSize.height + kRechargeContentInset;
    }

    
}

-(void)setChangeImageSize:(BOOL)changeImageSize{
    
    _changeImageSize = changeImageSize;
    [self setNeedsLayout];
}

-(float)requireHeightForWidht:(float)width attributedString1:(NSAttributedString *)attrStr1 attributedString2:(NSAttributedString *)attrStr2{
    
    float h = 0;
    
    float x = kTransactionHistoryCellSidePadding;
    float y = 0;
    
    float availableW = width - 2 * x;
    
    h = heightOfImageView * [UIScreen mainScreen].bounds.size.height/480;
    
    if(self.imageName1){
        
        y += h + kTransactionHistoryCellVerticalPadding;
    }
    
    if(self.attrStr1){
        
        CGSize labelSize = [MAUtility sizeForAttributedString:self.attrStr1 width:availableW];
        y += labelSize.height + kRechargeContentInset;
    }
    
    if(self.imageName2){
        
        y += h + kTransactionHistoryCellVerticalPadding;
    }
    
    if(self.attrStr2){
        
        CGSize labelSize = [MAUtility sizeForAttributedString:self.attrStr2 width:availableW];
        y += labelSize.height + kRechargeContentInset;
    }
    
    return y;

}


@end
