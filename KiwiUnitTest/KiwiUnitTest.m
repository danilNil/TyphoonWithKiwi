#import "Kiwi.h"
#import "LoginViewController.h"
#import "Typhoon.h"

SPEC_BEGIN(LoginViewControllerSpec)

/// Remove outer describe and context blocks, since they seemed unnecessary.
describe(@"LoginViewController", ^{
    /// By initializing the login view controller in a beforeEach block, we
    /// ensure that it is a "fresh" instance each test--i.e.: it does not
    /// retain any state from previous tests.
    __block LoginViewController* loginVC = nil;
    beforeEach(^{
        loginVC = [LoginViewController new];
    });

    describe(@"-onLogin:", ^{
        /// Because we are testing the view controller's buttons, we must
        /// ensure that -loadView is called before each test, so here we
        /// trigger -loadView by accessing the -view. We also set up the
        /// API mock, since we'll be using it in each of these tests.
        beforeEach(^{
            loginVC.apiService = [KWMock mockForProtocol:@protocol(ApiService)];
            [loginVC view];
        });

        /// This is identical to the third test in the original code:
        /// "On press Login with empty login and pass". So I deleted the last test.
        it(@"calls the API service", ^{
            [[(NSObject*)loginVC.apiService should] receive:@selector(loginWithUsername:password:completion:)];
            [loginVC.loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        });

        context(@"when the login and password fields are filled in", ^{
            NSString *login = @"testLogin";
            NSString *password = @"testPassword";

            /// No reason to mock these. We can set their values for realsies.
            beforeEach(^{
                loginVC.loginTextField.text = login;
                loginVC.passwordTextField.text = password;
            });

            it(@"calls the API service with those values", ^{
                [[(NSObject *)loginVC.apiService should] receive:@selector(loginWithUsername:password:completion:)
                                                   withArguments:login, password, [KWAny any], nil];
                [loginVC.loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
            });
        });
    });
});

SPEC_END