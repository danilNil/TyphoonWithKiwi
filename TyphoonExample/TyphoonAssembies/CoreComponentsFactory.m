//
//  ComponentsFactory.m
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "CoreComponentsFactory.h"
#import "UserDefaultsSettings.h"
#import "ApiServiceMock.h"
#import "Typhoon.h"

@implementation CoreComponentsFactory

- (id)apiService
{
    return [TyphoonDefinition withClass:[ApiServiceMock class] configuration:^(TyphoonDefinition *definition) {
        [definition injectMethod:@selector(initWithHostname:port:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:@"hostname"];
            [method injectParameterWith:@(1234)];
        }];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id)settings
{
    return [TyphoonDefinition withClass:[UserDefaultsSettings class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopeWeakSingleton;
    }];

}

@end
