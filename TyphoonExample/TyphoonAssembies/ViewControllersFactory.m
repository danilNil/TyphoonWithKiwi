//
//  ViewControllersFactory.m
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "ViewControllersFactory.h"
#import "CoreComponentsFactory.h"
#import "LoginViewController.h"
#import "SuccessViewController.h"
#import "Typhoon.h"

@interface ViewControllersFactory ()

@property (nonatomic, strong) CoreComponentsFactory *components;

@end

@implementation ViewControllersFactory

- (id)loginViewController
{
    return [TyphoonDefinition withClass:[LoginViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(settings)];
        [definition injectProperty:@selector(apiService) with:self.components.apiService];
        [definition injectProperty:@selector(viewControllersFactory) with:self];
    }];
}

- (id)successViewControllerWithResponseText:(NSString *)responseText
{
    return [TyphoonDefinition withClass:[SuccessViewController class] configuration:^(TyphoonDefinition *definition) {
        
        [definition injectMethod:@selector(initWithResponseText:settings:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:responseText];
            [initializer injectParameterWith:self.components.settings];
        }];
        
        [definition injectMethod:@selector(setSuccessNotice:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:@"My custom text"];
        }];
        
    }];
}

@end
