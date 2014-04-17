#import "Kiwi.h"

    SPEC_BEGIN(SpecName)

    describe(@"ClassName", ^{
        registerMatchers(@"BG");

        context(@"a state the component is in", ^{
            [[self shouldNot] beNil];
        });
    });

    SPEC_END