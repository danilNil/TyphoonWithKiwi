//
//  AppDelegate.m
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreComponentsFactory.h"
#import "ViewControllersFactory.h"
#import "CoreComponentsFactory.h"
#import "Typhoon.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [self loginViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)loginViewController
{
    NSArray *assemblies = @[[ViewControllersFactory assembly], [CoreComponentsFactory assembly]];
    ViewControllersFactory *factory = [TyphoonBlockComponentFactory factoryWithAssemblies:assemblies];
    return [factory loginViewController];
}


@end
