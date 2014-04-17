//
//  SuccessViewController.h
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"

@interface SuccessViewController : UIViewController

- (id)initWithResponseText:(NSString *)response settings:(id<Settings>)settings;

- (void)setSuccessNotice:(NSString *)notice;

@end
