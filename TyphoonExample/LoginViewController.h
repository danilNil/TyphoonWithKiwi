//
//  LoginViewController.h
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Settings.h"
#import "ApiService.h"
#import "ViewControllersFactory.h"

@interface LoginViewController : UIViewController

@property (nonatomic, strong) Injected id<Settings> settings;
@property (nonatomic, strong) Injected id<ApiService> apiService;

@property (nonatomic, strong) Injected ViewControllersFactory *viewControllersFactory;

@end
