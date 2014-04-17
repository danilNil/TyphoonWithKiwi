//
//  SuccessViewController.m
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()
@property (weak, nonatomic) IBOutlet UILabel *successLabel;
@property (weak, nonatomic) IBOutlet UILabel *responseLabel;

@end

@implementation SuccessViewController

- (id)initWithResponseText:(NSString *)response settings:(id<Settings>)settings
{
    self = [super initWithNibName:@"SuccessViewController" bundle:nil];
    if (self) {
        if (![self isViewLoaded]) {
            [self loadView];
        }
        
        NSParameterAssert(settings);
        self.responseLabel.text = response;
    }
    return self;
}

- (void) setSuccessNotice:(NSString *)notice
{
    self.successLabel.text = notice;
}

@end
