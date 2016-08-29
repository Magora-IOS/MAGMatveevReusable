
#import "NSObject+MAGMore.h"
#import <objc/runtime.h>

@implementation NSObject(MAGMore)

- (NSString *)rc_className {
	return [NSString stringWithUTF8String:class_getName([self class])];
}

+ (NSString *)rc_className {
	return [NSString stringWithUTF8String:class_getName(self)];
}

- (id)selfOrEmptyStringIfNil {
    id result = self;
    if (!result) {
        result = @"";
    }
    return result;
}

@end
