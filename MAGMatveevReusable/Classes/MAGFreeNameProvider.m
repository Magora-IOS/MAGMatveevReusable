//
//  FreeNameProvider.m
//  SMSCenter
//
//  Created by Matveev on 26/10/16.
//  Copyright © 2016 Magora Systems. All rights reserved.
//

#import "MAGFreeNameProvider.h"

@implementation MAGFreeNameProvider

- (instancetype)initWithBasepath:(NSString *)basepath formatWithSingleArgumentForNumberText:(NSString *)format {
	self = [super init];
	if (self) {
		_basepath = basepath;
		_format = format;
	}
	return self;
}

//		example for apendableName @"video" -> @"video_1", @"video_2" etc.
- (NSArray <NSString *> *)generateShortFreeNamesCount:(NSInteger)neededCount indexFromWhichStart:(NSNumber *)indexFromWhichStart {
	NSMutableArray *result = @[].mutableCopy;
	NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.basepath error:nil];
	NSMutableArray *filesWithoutExtension = [NSMutableArray array];
	for (NSString *filename in files) {
		NSString *strWithoutExtension = [filename stringByDeletingPathExtension];
		[filesWithoutExtension addObject:strWithoutExtension];
	}
	
	BOOL freenameFound = NO;
	NSInteger index = 1;
	if (indexFromWhichStart) {
		index = indexFromWhichStart.integerValue;
	}
	while (result.count < neededCount) {
		freenameFound = NO;
		while (!freenameFound) {
			NSString *possibleFreename = [NSString stringWithFormat:self.format, @(index).stringValue];
			++index;
			BOOL suchNameExists = [filesWithoutExtension containsObject:possibleFreename];
			if (!suchNameExists) {
				[result addObject:possibleFreename];
				break;
			}
		}
	}
	return result;
}

@end
