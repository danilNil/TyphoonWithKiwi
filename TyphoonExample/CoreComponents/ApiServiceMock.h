//
//  ApiServiceImpl.h
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiService.h"

@interface ApiServiceMock : NSObject <ApiService>

- (id)initWithHostname:(NSString *)hostname port:(NSUInteger)port;

@end
