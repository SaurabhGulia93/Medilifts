//
//  MAProgessView.m
//  MyAirtel
//
//  Created by Amit Gupta on 23/02/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import "MAProgessView.h"
#import "MLStyle.h"
#import "MAUtility.h"

@interface MAProgessView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, assign) BOOL animated;
@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation MAProgessView

+ (void)showProgressViewInWindow:(UIWindow *)window animated:(BOOL)animated withTitle:(NSString *)title
{
    MAProgessView *pView = [[MAProgessView alloc] initWithFrame:window.bounds];
    pView.animated = animated;
    pView.titleLabel.text = title;
    
    [window addSubview:pView];
    
    if (!animated) {
        return;
    }
    
    [pView layoutIfNeeded];
    [pView setIsAnimating:YES];
    
    pView.bgView.alpha = 0.0;
    pView.containerView.alpha = 0.0;
    //    pView.containerView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    
    [UIView animateWithDuration:0.4
                          delay:0.0
         usingSpringWithDamping:1.0f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         pView.bgView.alpha = 1.0;
                         pView.containerView.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         [pView setIsAnimating:NO];
                     }];
    
    //    [UIView animateWithDuration:0.4
    //                          delay:0.0
    //         usingSpringWithDamping:0.5f
    //          initialSpringVelocity:0.0f
    //                        options:UIViewAnimationOptionAllowAnimatedContent
    //                     animations:^{
    //                         pView.containerView.transform = CGAffineTransformIdentity;
    //                     }
    //                     completion:^(BOOL finished) {
    //                         [pView setIsAnimating:NO];
    //                     }];
}

+ (void)hideProgressViewInWindow:(UIWindow *)window animated:(BOOL)animated;
{
    MAProgessView *pView = nil;
    for (UIView *view in [[window subviews] reverseObjectEnumerator]) {
        if ([view isKindOfClass:[MAProgessView class]]) {
            pView = (MAProgessView *)view;
            break;
        }
    }
    
    if (!pView) {
        return;
    }
    
    if (!animated) {
        [pView removeFromSuperview];
        return;
    }
    
    [pView setIsAnimating:YES];
    
    [UIView animateWithDuration:0.4
                          delay:0.0
         usingSpringWithDamping:1.0f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         pView.bgView.alpha = 0.0;
                         pView.containerView.alpha = 0.0;
                         //                         pView.containerView.transform = CGAffineTransformMakeScale(0.7, 0.7);
                     }
                     completion:^(BOOL finished) {
                         [pView removeFromSuperview];
                     }];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.bgView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.bgView.backgroundColor = kDimOutViewColor;
        [self addSubview:_bgView];
        
        self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
        self.containerView.backgroundColor = [UIColor lightGrayColor];
        self.containerView.layer.cornerRadius = kItemCornerRadius;
        [self addSubview:self.containerView];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.containerView addSubview:_contentView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = kLoaderViewFont;
        self.titleLabel.textColor = kGrayFontColor;
        [self.contentView addSubview:self.titleLabel];
        
        self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.activityView startAnimating];
        self.activityView.color = kLoaderGrayColor;
        [self.contentView addSubview:self.activityView];
    }
    return self;
}

- (void)layoutSubviews
{
    if (_isAnimating) {
        return;
    }
    
    CGSize size = self.bounds.size;
    
    float containerW = size.width - 2.0 * kTableViewLargePadding;
    float contentW = containerW - 2.0 * kItemCornerRadius;
    float labelMaxW = contentW - 2.0 * kTableViewLargePadding;
    
    CGSize titleSize = [MAUtility sizeForString:self.titleLabel.text font:self.titleLabel.font width:labelMaxW];
    contentW = MAX(titleSize.width, self.activityView.bounds.size.width) + 2.0 * kTableViewLargePadding;
    containerW = contentW + 2.0 * kItemCornerRadius;
    
    float padding = kTableViewLargePadding;
    float inPadding = kTableViewLargePadding;
    float contentH = round(titleSize.height + 2.0 * padding + inPadding + self.activityView.bounds.size.height);
    float containerH = contentH + 2.0 * kItemCornerRadius;
    
    CGRect containerFrame = (CGRect) {floorf((size.width - containerW)/2.0), floorf((size.height - containerH)/2.0), containerW, containerH};
    self.containerView.frame = containerFrame;
    
    CGRect contentRect = CGRectInset(self.containerView.bounds, kItemCornerRadius, kItemCornerRadius);
    self.contentView.frame = contentRect;
    
    size = self.contentView.bounds.size;
    
    self.bgView.frame = self.bounds;
    self.titleLabel.frame = (CGRect) {floor((size.width - titleSize.width)/2.0), size.height - padding - titleSize.height, titleSize};
    self.activityView.center = (CGPoint) {floor(size.width/2.0), padding + self.activityView.bounds.size.height/2.0};
    
    self.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.containerView.layer.shadowOffset = (CGSize) {0.0, 1.0};
    self.containerView.layer.shadowRadius = 2.0;
    self.containerView.layer.shadowOpacity = 0.4;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.containerView.bounds cornerRadius:kItemCornerRadius];
    self.containerView.layer.shadowPath = path.CGPath;
}

@end
