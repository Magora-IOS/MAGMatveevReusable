
#import <Foundation/Foundation.h>

#define PropertyNameForClass(Klass, PropertyName) \
(((void)(NO && ((void)[Klass _nullObjectForFindingPropertyName].PropertyName, NO)), # PropertyName))

#define PropertyStringForClass(Klass, PropertyName) \
@PropertyNameForClass(Klass, PropertyName)

@interface NSObject(MAGMore)

- (NSString *)mag_className;
+ (NSString *)mag_className;

- (id)selfOrEmptyStringIfNil;

+ (instancetype)_nullObjectForFindingPropertyName;

@end
