
#import <Foundation/Foundation.h>

@interface NSObject(MAGMore)

- (NSString *)rc_className;
+ (NSString *)rc_className;

- (id)selfOrEmptyStringIfNil;

@end
