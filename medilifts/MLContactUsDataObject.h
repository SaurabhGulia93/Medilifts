//
//  MLContactUsDataObject.h
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLContactUsDataObject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *placeHolderTitle;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, assign) BOOL isInvalid;

@end
