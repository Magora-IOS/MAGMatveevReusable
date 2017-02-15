








#import "MAGCacheCleaner.h"

@implementation MAGCacheCleaner

+ (MAGCacheCleaner *)sharedInstance {
    static dispatch_once_t once;
    static MAGCacheCleaner *sharedCacheCleaner;
    dispatch_once(&once, ^{
        sharedCacheCleaner = [[MAGCacheCleaner alloc] init];
    });
    return sharedCacheCleaner;
}

//		if olderDate == nil then clear cache instantly
- (BOOL)amountTimeBetweenTodayAndOlderDate:(NSDate *)olderDate moreThanAmountTimeComponents:(NSDateComponents *)amountTimeComponents
{
    if (olderDate) {
        NSDate *todayDate = [NSDate date];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *olderDatePlusAmountTime = [calendar dateByAddingComponents:amountTimeComponents toDate:olderDate options:0];
        //		если сегодняшняя дата больше чем "указанная дата плюс указанный срок"
        if ([todayDate compare:olderDatePlusAmountTime] == NSOrderedDescending) {
            return YES;
        }
    } else {
        return YES;
    }
    return NO;
}

//		return count of removed files
- (NSUInteger)removeOldFilesOverCount:(NSUInteger)count atDirPath:(NSString *)dirPath
{
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *filenames = [fileManager contentsOfDirectoryAtPath:dirPath error:&error];
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    NSMutableArray *filepaths = [[NSMutableArray alloc] init];
    if (error.code == 0) {
        BOOL isDir;
        //		проверяем существует ли директория кеша
        if ([fileManager fileExistsAtPath:dirPath isDirectory:&isDir] && isDir) {
            NSString *filePath;
            //		идем по объектам файловой системы
            for (NSString *curFilename in filenames) {
                filePath = [NSString stringWithFormat:@"%@/%@",dirPath,curFilename];
                //		если объект файл
                if ([fileManager fileExistsAtPath:filePath isDirectory:&isDir] && !isDir) {
                    //		узнаем время последнего доступа к файлу
                    NSDictionary *fileAttributesDict = [[NSURL fileURLWithPath:filePath] resourceValuesForKeys:[NSArray arrayWithObject:NSURLContentAccessDateKey] error:&error];
                    if (error.code == 0) {
//                        NSLog(@"%@",fileAttributesDict.allKeys);
                        NSDate *lastAccessDate = [fileAttributesDict objectForKey:@"NSURLContentAccessDateKey"];
                        [dates addObject:lastAccessDate];
                        [filepaths addObject:filePath];
                    }
                }
            }
        }
    }
    
    for (int i = 0; i < (int)dates.count-1; ++i) {
        for (int k = i + 1; k < (int)dates.count-1; ++k) {
            //		если текущая дата больше чем следующая
            if ([(NSDate *)[dates objectAtIndex:i] compare:[dates objectAtIndex:k]] == NSOrderedAscending) {
                
                //		сортируем давность доступа по возрастанию (сперва самое новое)
                [dates exchangeObjectAtIndex:k withObjectAtIndex:i];
            }
        }
    }
    NSInteger countOfRemovedFiles = 0;
    for (NSInteger i = count; i < dates.count; ++i) {
        [fileManager removeItemAtPath:[filepaths objectAtIndex:i] error:&error];
        if (error.code) {
            NSLog(@"error in removing of old cache's file with path %@",[filepaths objectAtIndex:i]);
        } else {
            ++countOfRemovedFiles;
        }
    }
    
    return countOfRemovedFiles;
}

@end
