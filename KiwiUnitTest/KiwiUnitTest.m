#import "Kiwi.h"
#import "LoginViewController.h"
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
            context(@"On press Login", ^{
                it(@"should call Api service", ^{
                    loginVC.apiService = [KWMock mockForProtocol:@protocol(ApiService)];
                    [[(NSObject*)loginVC.apiService should] receive:@selector(loginWithUsername:password:completion:)];
                    [loginVC onLogin:nil];
                });
            });
            
            context(@"On press Login with existed login and pass", ^{
                it(@"should call Api service with test pass and test login", ^{
                NSString* pass = @"testPass";
                NSString* login = @"testLogin";
                    loginVC.loginTextField = [KWMock mockForClass:[UITextField class]];
                    loginVC.passwordTextField = [KWMock mockForClass:[UITextField class]];
                    [loginVC.passwordTextField stub:@selector(text) andReturn:pass];
                    [loginVC.loginTextField stub:@selector(text) andReturn:login];
                    loginVC.apiService = [KWMock mockForProtocol:@protocol(ApiService)];
                    [[(NSObject*)loginVC.apiService should] receive:@selector(loginWithUsername:password:completion:) withArguments:login, pass, any()];
                    [loginVC onLogin:nil];
                });
            });
            
            context(@"On press Login with empty login and pass", ^{
                it(@"shouldn't call Api service with test pass and test login", ^{
                    loginVC.loginTextField = [KWMock mockForClass:[UITextField class]];
                    loginVC.passwordTextField = [KWMock mockForClass:[UITextField class]];
                    [loginVC.passwordTextField stub:@selector(text) andReturn:@""];
                    [loginVC.loginTextField stub:@selector(text) andReturn:@""];
                    loginVC.apiService = [KWMock mockForProtocol:@protocol(ApiService)];
                    [[(NSObject*)loginVC.apiService shouldNot] receive:@selector(loginWithUsername:password:completion:) withArguments:@"", @"", any()];
                    [loginVC onLogin:nil];
                });
            });
        });
    });
});
SPEC_END