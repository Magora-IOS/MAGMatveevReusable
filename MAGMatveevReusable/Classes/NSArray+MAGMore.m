








#import "NSArray+MAGMore.h"

@implementation NSArray (MAGMore)

- (BOOL)hasItems {
	BOOL result = self.count > 0;
	return result;
}
@end
