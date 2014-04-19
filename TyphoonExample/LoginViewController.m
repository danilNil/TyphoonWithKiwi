//
//  LoginViewController.m
//  TyphoonExample
//
//  Created by Aleksey Garbarev on 20.03.14.
//  Copyright (c) 2014 Aleksey Garbarev. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.loginTextField.text = [self.settings optionForName:@"lastUsername"];
    self.passwordTextField.text = [self.settings optionForName:@"lastPassword"];
}

- (IBAction)onLogin:(id)sender
{
    NSString *username = self.loginTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [self.settings saveOption:username forName:@"lastUsername"];
    [self.settings saveOption:password forName:@"lastPassword"];
    
    [self.apiService loginWithUsername:username password:password completion:^(NSString *serverHello){
        
        UIViewController *successController = [self.viewControllersFactory successViewControllerWithResponseText:serverHello];
        [self presentViewController:successController animated:YES completion:nil];
        
    }];
}

@end
