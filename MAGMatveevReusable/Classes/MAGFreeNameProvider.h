//
//  FreeNameProvider.h
//  SMSCenter
//
//  Created by Matveev on 26/10/16.
//  Copyright © 2016 Magora Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAGFreeNameProvider : NSObject

@property (copy, nonatomic) NSString *basepath;
@property (copy, nonatomic) NSString *format;
@property (copy, nonatomic) NSString *appendableName;

- (instancetype)initWithBasepath:(NSString *)basepath formatWithSingleArgumentForNumberText:(NSString *)format;
- (NSArray <NSString *> *)generateShortFreeNamesCount:(NSInteger)neededCount indexFromWhichStart:(NSNumber *)indexFromWhichStart;

@end
