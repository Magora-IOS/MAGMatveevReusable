








#import <Foundation/Foundation.h>

#import "NSObject+MAGMore.h"

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...) {}
#endif

#define RUN_BLOCK(block, ...) if (block != nil) { block(__VA_ARGS__); }
#define RGB(R,G,B)    [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:1.0]
#define RGBA(R,G,B,A) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:A]
#define IMG(name) [UIImage imageNamed:name]
#define LS(str) NSLocalizedString(str, nil)

#define ESCAPED(str) [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]
#define RIGHTBOOL(expression) expression ? YES : NO

#define ASSERT(condition) NSAssert(condition,@"CUSTOM ASSERT WARNING")
#define CUSTOM_ERROR(text) [[NSError alloc] initWithDomain:@"CustomDomain" code:5 userInfo:@{ NSLocalizedDescriptionKey : text}]
#define THROW_EXCEPTION(exceptionName,reasonText) @throw [NSException exceptionWithName:exceptionName reason:reasonText userInfo:nil];
#define THROW_MISSED_IMPLEMENTATION_EXCEPTION @throw [NSException exceptionWithName:[NSString stringWithFormat:@"class %@: bad implementation",[self mag_className]] reason:[NSString stringWithFormat:@"method %s not implemented",__PRETTY_FUNCTION__] userInfo:nil];

#define RELAYOUT(view) [view setNeedsLayout];[view layoutIfNeeded];
#define CORRECTED_BOOL(expression) (expression ? YES : NO)

#define IOS_VERSION_FIRST_NUMBER ([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] firstObject] integerValue])
#define IOS_VERSION_SECOND_NUMBER ([[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."].count > 1 ? [[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:1] integerValue] : 0)
#define IOS_VERSION_THIRD_NUMBER ([[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."].count > 2 ? [[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:2] integerValue] : 0)

typedef void(^MAGErrorBlock)(NSError *error);
typedef void(^MAGArrayBlock)(NSArray *items);
typedef void(^MAGDictBlock)(NSDictionary *dict);

typedef void(^MAGBoolBlock)(BOOL boolValue);
typedef void(^MAGIntegerBlock)(NSInteger value);
typedef void(^MAGIndexBlock)(NSInteger index);
typedef void(^MAGDoubleBlock)(CGFloat value);

typedef void(^MAGNumberBlock)(NSNumber *number);
typedef void(^MAGPointBlock)(CGPoint point);
typedef void(^MAGFrameBlock)(CGRect frame);
typedef void(^MAGIndexPathBlock)(NSIndexPath *indexPath);

typedef void(^MAGItemBlock)(id item);
typedef void(^MAGCellBlock)(UITableViewCell *cell);
typedef void(^MAGHeaderCellBlock)(UITableViewCell *cell, NSString *sortProperty, BOOL ascending);


#define IS_DEBUG_BUILD mag_isDebugBuild()

BOOL mag_isDebugBuild();



#define EQUAL(a,b) mag_isEqualObjects(a,b)

BOOL mag_isEqualObjects(id obj1, id obj2);

#define IS_THIS_BUILD_DOWNLOADED_FROM_APPSTORE mag_isThisBuildDownloadedFromAppStore()
BOOL mag_isThisBuildDownloadedFromAppStore();

#define IS_PHONE [MAGCommonDefines isPhoneDevice]
#define IS_PAD [MAGCommonDefines isPadDevice]
#define IS_RETINA [MAGCommonDefines isRetina]
#define IS_PHONE_4 [MAGCommonDefines isIphone4]
#define IS_PHONE_5 [MAGCommonDefines isIphone5]
#define IS_PHONE_6 [MAGCommonDefines isPhone6]
#define IS_PHONE_6_PLUS [MAGCommonDefines isPhone6Plus]

@interface MAGCommonDefines : NSObject

+ (BOOL)isPhoneDevice;
+ (BOOL)isPadDevice;
+ (BOOL)isRetina;
+ (BOOL)isIphone4;
+ (BOOL)isIphone5;
+ (BOOL)isPhone6;
+ (BOOL)isPhone6Plus;

+ (CGRect)mainScreenBoundsPortrait;
+ (CGRect)mainScreenBoundsLandscape;

@end
