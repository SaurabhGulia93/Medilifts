//
//  MLUtility.m
//  medilifts
//
//  Created by Saurabh on 4/17/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "MAUtility.h"
#import "MAToast.h"
#import "MLStyle.h"
#import "AppDelegate.h"
#import "MAProgessView.h"

@interface MAUtility ()  {
    CGPathRef _svgPath;
    float _rechargePadding;
    float _layoverPadding;
    float _mainContentPadding;
    float _fullScreenHeaderMaxHeight;
}

@end

@implementation MAUtility

+ (MAUtility *)shared
{
    static dispatch_once_t onceToken;
    static MAUtility *shared = nil;
    
    dispatch_once(&onceToken, ^{
        shared = [[super allocWithZone:NULL] init];
        
    });
    
    return shared;
}


+ (CGSize)sizeForAttributedString:(NSAttributedString *)attrString width:(float)width height:(float)height
{
    CGSize size = [attrString boundingRectWithSize:(CGSize) {width, height} options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

+ (CGSize)sizeForAttributedString:(NSAttributedString *)attrString width:(float)width
{
    CGSize size = [attrString boundingRectWithSize:(CGSize) {width, NSUIntegerMax} options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

+ (CGSize)sizeForString:(NSString *)string font:(UIFont *)font width:(float)width
{
    if (!font || !string) {
        return CGSizeZero;
    }
    
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName : font}];
    return [self sizeForAttributedString:attrString width:width];
}

+ (CGSize)sizeForAttributedString:(NSAttributedString *)attrString
{
    if (!attrString) {
        return CGSizeZero;
    }
    
    CGSize size = attrString.size;
    size.width = ceil(size.width);
    size.height = ceil(size.height);
    return size;
}

+ (void)showToast:(NSString *)message
{
    if (message.length == 0) {
        return;
    }
    
    [[MAToast shared] showToastMessage:message];
}

+(BOOL)validatePhoneNumberString:(NSString *)phNoString{
    
    BOOL isValid = NO;
    NSCharacterSet *_NumericOnly = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *myStringSet = [NSCharacterSet characterSetWithCharactersInString:phNoString];
    
    if ((phNoString.length == 10) && [_NumericOnly isSupersetOfSet: myStringSet])
    {
        //String entirely contains decimal numbers only.
        isValid = YES;
    }
    
    return isValid;
}

+ (BOOL)stringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (float)rechargeContentPadding
{
    if (_rechargePadding > 0.0) {
        return _rechargePadding;
    }
    
    float width = [UIScreen mainScreen].bounds.size.width;
    float contentW = width - 2.0 * kRechargeContentMaxInset;
    if (contentW < kRechargeContentMinWidth) {
        contentW = kRechargeContentMinWidth;
    }
    
    _rechargePadding = floor((width - contentW)/2.0);
    return _rechargePadding;
}

+ (void)showHUDWithTitle:(NSString *)title
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MAProgessView showProgressViewInWindow:delegate.window animated:YES withTitle:title];
    //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:delegate.window animated:YES];
    //    hud.mode = MBProgressHUDModeIndeterminate;
    //    hud.labelText = title;
}

+ (void)hideHUD
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [MAProgessView hideProgressViewInWindow:delegate.window animated:YES];
    //    [MBProgressHUD hideHUDForView:delegate.window animated:YES];
}



@end
