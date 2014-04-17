//
//  UserDefaultsSettings.m
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "UserDefaultsSettings.h"

@implementation UserDefaultsSettings {
    NSUserDefaults *_userDefaults;
}

- (id)init
{
    self = [super init];
    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)saveOption:(id<NSCoding>)options forName:(NSString *)name
{
    [_userDefaults setObject:options forKey:name];
    [_userDefaults synchronize];
}

- (id)optionForName:(NSString *)name
{
    return [_userDefaults objectForKey:name];
}

@end
