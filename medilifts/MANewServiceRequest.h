//
//  MANewServiceRequest.h
//  MyAirtel
//
//  Created by Nishit Sharma on 2/3/15.
//  Copyright (c) 2015 IgniteWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MANewServiceRequest : NSObject

@property (nonatomic, strong) NSString * email_id;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, strong) NSString * request_description;
@property (nonatomic, strong) NSString *title;


@end
