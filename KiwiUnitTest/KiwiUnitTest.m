#import "Kiwi.h"
#import "LoginViewController.h"
#import "CoreComponentsFactory.h"
#import "Typhoon.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)onLogin:(id)sender;

@end

SPEC_BEGIN(LoginViewControllerSpec)
describe(@"initialisation all services", ^{
    
    context(nil, ^{
        describe(@"Login View Controller", ^{
            LoginViewController* loginVC = [LoginViewController new];
            context(@"Did input non empty password and mail", ^{
                //            loginVC.loginTextField.text = @"test";
                //            loginVC.passwordTextField.text = @"test";
                it(@"should call Api service", ^{
                    loginVC.apiService = [KWMock mockForProtocol:@protocol(ApiService)];
                    [[(NSObject*)loginVC.apiService should] receive:@selector(loginWithUsername:password:completion:)];
                    [loginVC onLogin:nil];
                });
            });
        });
    });
});
SPEC_END