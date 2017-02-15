








#import <Foundation/Foundation.h>

@interface MAGCacheCleaner : NSObject

+ (MAGCacheCleaner *)sharedInstance;

- (BOOL)amountTimeBetweenTodayAndOlderDate:(NSDate *)olderDate moreThanAmountTimeComponents:(NSDateComponents *)amountTimeComponents;
- (NSUInteger)removeOldFilesOverCount:(NSUInteger)count atDirPath:(NSString *)dirPath;

@end
