
#import "MAGFileSystem.h"

@implementation MAGFileSystem

+ (NSString *)filenameStringWithinExtensionFromPath:(NSString *)filepath
{
    NSString* result = [filepath lastPathComponent];
    return result;
}

+ (NSString *)filenameStringWithoutExtension:(NSString *)filename
{
    NSString* result = [[filename lastPathComponent] stringByDeletingPathExtension];
    return result;
}

#pragma mark - File system

+ (NSError *)createDirectoryWithPath:(NSString *)dirPath
{
    NSError *result;
    [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&result];
    return result;
}

+ (BOOL)directoryWithPathExists:(NSString *)dirPath
{
    BOOL result = NO;
    FileSystemObjectType fileSystemObjectType = [MAGFileSystem fileSystemObjectTypeWithPath:dirPath];
    if (fileSystemObjectType == FileSystemObjectTypeDirectory) {
        result = YES;
    }
    return result;
}

+ (BOOL)fileWithPathExists:(NSString *)filePath
{
    BOOL result = NO;
    FileSystemObjectType fileSystemObjectType = [MAGFileSystem fileSystemObjectTypeWithPath:filePath];
    if (fileSystemObjectType == FileSystemObjectTypeFile) {
        result = YES;
    }
    return result;
}

+ (FileSystemObjectType)fileSystemObjectTypeWithPath:(NSString *)path
{
    FileSystemObjectType resultType = FileSystemObjectTypeObjectNotExists;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    BOOL objectExists = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if (objectExists) {
        if (isDir) {
            resultType = FileSystemObjectTypeDirectory;
        } else {
            resultType = FileSystemObjectTypeFile;
        }
    }
    return resultType;
}

+ (NSArray *)filenamesAtDirPath:(NSString *)dirPath
{
    NSArray *resultFilenames;
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    resultFilenames = [fileManager contentsOfDirectoryAtPath:dirPath error:&error];
    return resultFilenames;
}

+ (NSDate *)latestAccessDateOfFileWithPath:(NSString *)filePath
{
    NSDate *resultDate;
    NSError *error;
    if ([MAGFileSystem fileWithPathExists:filePath]) {
        NSDictionary *fileAttributesDict = [[NSURL fileURLWithPath:filePath] resourceValuesForKeys:[NSArray arrayWithObject:NSURLContentAccessDateKey] error:&error];
        if (error.code == 0) {
            resultDate = [fileAttributesDict objectForKey:NSURLContentAccessDateKey];
        }
    }
    return resultDate;
}

+ (NSString *)filePathByAppendingFileName:(NSString *)filename toDirPath:(NSString *)dirPath
{
    NSString *result;
    result = [NSString stringWithFormat:@"%@/%@",dirPath,filename];
    return result;
}

+ (NSString *)filePath:(NSString *)filePath withReplacedFilename:(NSString *)newFilename
{
    NSString *result;
    NSMutableArray *pathComponents = [[filePath componentsSeparatedByString:@"/"] mutableCopy];
    [pathComponents removeLastObject];
    [pathComponents addObject:newFilename];
    result = [pathComponents componentsJoinedByString:@"/"];
    return result;
}

+ (NSString *)filePath:(NSString *)filepath withNewFileExtension:(NSString *)newFileExtension
{
    NSString *resut = [filepath mutableCopy];
    NSString *filePathExtension = [filepath pathExtension];
    if (filePathExtension) {
        resut = [resut stringByDeletingPathExtension];
    }
    resut = [resut stringByAppendingPathExtension:newFileExtension];
    return resut;
}

+ (NSString *)changeExtensionOfFileWithPath:(NSString *)filepath withNewFileExtension:(NSString *)newFileExtension
{
    NSString *result;
    NSString *newFilePath = [MAGFileSystem filePath:filepath withNewFileExtension:newFileExtension];
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] moveItemAtPath:filepath toPath:newFilePath error:&error];
    if (success) {
        result = newFilePath;
        NSLog(@"FILEPATH  %@ RENAMED TO %@",filepath,result);
    }
    return result;
}

+ (BOOL)copyFileFromPath:(NSString *)sourceFilepath toPath:(NSString *)destinationFilepath
{
    BOOL result;
    NSError *error;
    result = [[NSFileManager defaultManager] copyItemAtPath:sourceFilepath toPath:destinationFilepath error:&error];
    return result;
}

+ (BOOL)moveFileFromPath:(NSString *)sourceFilepath toPath:(NSString *)destinationFilepath
{
    BOOL result;
    NSError *error;
    result = [[NSFileManager defaultManager] moveItemAtPath:sourceFilepath toPath:destinationFilepath error:&error];
    return result;
}




#pragma mark - System dirs

+ (NSString *)applicationDocumentsDirectoryPath
{
    return [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)applicationLibraryDirectoryPath
{
    NSString *result = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    return result;
}

+ (NSString *)applicationCachesDirectoryPath
{
    return [NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)applicationTempDirectoryPath
{
    NSURL *tempDirUrl = [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
    NSString *result = 	[tempDirUrl path];
    return result;
}

@end
