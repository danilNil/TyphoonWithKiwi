//
//  ApiServiceImpl.m
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "ApiServiceMock.h"

@implementation ApiServiceMock {
    NSString *_hostname;
    NSUInteger _port;
}

- (id)initWithHostname:(NSString *)hostname port:(NSUInteger)port
{
    self = [super init];
    if (self) {
        _port = port;
        _hostname = hostname;
    }
    return self;
}

- (void)loginWithUsername:(NSString *)name password:(NSString *)pass completion:(void (^)(NSString *))completion
{
    NSParameterAssert(_hostname);
    NSParameterAssert(_port);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completion(@"Hello from fake server");
    });
}

@end
