//
//  ViewController.h
//  medilifts
//
//  Created by Saurabh on 5/1/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLParentViewController.h"

typedef enum
{
    MLName = 0,
    MLEmail = 1,
    MLPhoneNumber = 2,
    MLMessage = 3
} MANewSRCellType;

#define kNewSRDescMinCharCount 25

@interface MLContactUSViewController : MLParentViewController

@end
