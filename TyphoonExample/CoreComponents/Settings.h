//
//  Settings.h
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Settings <NSObject>

- (void)saveOption:(id<NSCoding>)options forName:(NSString *)name;
- (id)optionForName:(NSString *)name;

@end
