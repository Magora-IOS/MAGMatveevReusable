
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FileSystemObjectType) {
    FileSystemObjectTypeDirectory,
    FileSystemObjectTypeFile,
    FileSystemObjectTypeObjectNotExists
};

@interface MAGFileSystem : NSObject

+ (BOOL)fileWithPathExists:(NSString *)filePath;
+ (BOOL)directoryWithPathExists:(NSString *)dirPath;
+ (NSError *)createDirectoryWithPath:(NSString *)dirPath;
+ (FileSystemObjectType)fileSystemObjectTypeWithPath:(NSString *)path;
+ (NSArray *)filenamesAtDirPath:(NSString *)dirPath;

+ (NSString *)filenameStringWithinExtensionFromPath:(NSString *)filepath;
+ (NSString *)filenameStringWithoutExtension:(NSString *)filename;

/*!     @return     Nil if was error.
 @warn       Please, sure you not read/write data from/to this file at other cases excluding cases which you know. Else your program logics by using this parameter will seriously "corrupted" by other accesses to this file*/
+ (NSDate *)latestAccessDateOfFileWithPath:(NSString *)filePath;
+ (NSString *)filePathByAppendingFileName:(NSString *)filename toDirPath:(NSString *)dirPath;
+ (NSString *)filePath:(NSString *)filePath withReplacedFilename:(NSString *)newFilename;
+ (NSString *)filePath:(NSString *)filePath withNewFileExtension:(NSString *)newFileExtension;
//!     @return     New file path if success, else nil
+ (NSString *)changeExtensionOfFileWithPath:(NSString *)filepath withNewFileExtension:(NSString *)newFileExtension;
+ (BOOL)copyFileFromPath:(NSString *)sourceFilepath toPath:(NSString *)destinationFilepath;
+ (BOOL)moveFileFromPath:(NSString *)sourceFilepath toPath:(NSString *)destinationFilepath;

+ (NSString *)applicationDocumentsDirectoryPath;
+ (NSString *)applicationLibraryDirectoryPath;
+ (NSString *)applicationCachesDirectoryPath;
+ (NSString *)applicationTempDirectoryPath;

@end
