//
//  MLUtility.h
//  medilifts
//
//  Created by Saurabh on 4/17/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kLightFontName @"HelveticaNeue-Light"
#define kRegularFontName @"HelveticaNeue"
#define kMediumFontName @"HelveticaNeue-Medium"
#define kBoldFontName @"HelveticaNeue-Bold"


#define RGB(x, y, z) [UIColor colorWithRed:x/255.0f green:y/255.0f blue:z/255.0f alpha:1.0]
#define RGBA(x, y, z, a) [UIColor colorWithRed:x/255.0f green:y/255.0f blue:z/255.0f alpha:a]
#define GRAYA(x, a) [UIColor colorWithWhite:x alpha:a]
#define GRAY(x) [UIColor colorWithWhite:x alpha:1.0]


#define LIGHT(x) [UIFont fontWithName:kLightFontName size:x]
#define REGULAR(x) [UIFont fontWithName:kRegularFontName size:x]
#define MEDIUM(x) [UIFont fontWithName:kMediumFontName size:x]
#define BOLD(x) [UIFont fontWithName:kBoldFontName size:x]

#define kBlackFontColor GRAY(0.2)
#define kDarkerGrayFontColor GRAY(0.4)
#define kGrayFontColor GRAY(0.5)
#define kLightGrayColor GRAY(0.6)
#define kTVPlaceholderColor GRAY(0.7)
#define kLoaderGrayColor GRAY(0.3)
#define kWhiteColor RGB(255, 255, 255)

#define MARect(x, y, a, b) (CGRect) {floor(x), floor(y), ceil(a), ceil(b)}
#define MAFloorRect(x, y, a, b) (CGRect) {floor(x), floor(y), floor(a), floor(b)}
#define MACenteredOrigin(x, y) floor((x - y)/2.0)


@interface MAUtility : NSObject

+ (CGSize)sizeForAttributedString:(NSAttributedString *)attrString width:(float)width;
+ (CGSize)sizeForAttributedString:(NSAttributedString *)attrString;
+ (CGSize)sizeForString:(NSString *)string font:(UIFont *)font width:(float)width;
+ (CGSize)sizeForString:(NSString *)string font:(UIFont *)font;

+ (void)showToast:(NSString *)message;
+(BOOL)validatePhoneNumberString:(NSString *)phNoString;
+ (BOOL)stringIsValidEmail:(NSString *)checkString;

+ (MAUtility *)shared;
- (float)rechargeContentPadding;

+ (void)showHUDWithTitle:(NSString *)title;
+ (void)hideHUD;

@end
