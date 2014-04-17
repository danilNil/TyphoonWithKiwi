//
//  ViewControllersFactory.h
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "TyphoonAssembly.h"

@interface ViewControllersFactory : TyphoonAssembly

- (id)loginViewController;
- (id)successViewControllerWithResponseText:(NSString *)responseText;

@end
