








#import "NSDictionary+MAGMore.h"
#import "MAGCommonDefines.h"

@implementation NSDictionary (MAGMore)

- (BOOL)isValidValueForKeyExists:(NSString *)key {
	BOOL result = NO;
	id obj = [self valueForKey:key];
	result = CORRECTED_BOOL(obj) && !EQUAL(obj, [NSNull null]);
	return result;
}

@end
