//
//  ApiService.h
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApiService <NSObject>

- (void)loginWithUsername:(NSString *)name password:(NSString *)pass completion:(void(^)(NSString *serverHello))completion;

@end
