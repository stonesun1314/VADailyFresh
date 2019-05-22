//
//  NSFileManager+Vanke.m
//  DailyFresh
//
//  Created by Mac on 2019/5/22.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "NSFileManager+Vanke.h"

@implementation NSFileManager (Vanke)

- (NSString *)applicationDocumentsDirectory;
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)applicationLibraryDirectory;
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)applicationMusicDirectory;
{
    return [NSSearchPathForDirectoriesInDomains(NSMusicDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)applicationMoviesDirectory;
{
    return [NSSearchPathForDirectoriesInDomains(NSMoviesDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)applicationPicturesDirectory;
{
    return [NSSearchPathForDirectoriesInDomains(NSPicturesDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSString *)applicationTemporaryDirectory;
{
    return NSTemporaryDirectory();
}

- (NSString *)applicationCachesDirectory;
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error{
    NSMutableArray * sub = [[self contentsOfDirectoryAtPath:path error:error] mutableCopy];
    
    BOOL isDir = false;
    NSString * tmpPath = nil;
    for (NSInteger i = [sub count]-1;i>=0;i--) {
        tmpPath = [path stringByAppendingPathComponent:[sub objectAtIndex:i]];
        
        if([self fileExistsAtPath:tmpPath isDirectory:&isDir] && isDir){
            [sub replaceObjectAtIndex:i withObject:tmpPath];
        }
        else{
            [sub removeObjectAtIndex:i];
        }
        
    }
    
    return [NSArray arrayWithArray:sub];
}

- (NSArray *)filesInDirectory:(NSURL *)directory withExtensions:(NSSet *)fileTypes directoryEnumerationOptions:(NSDirectoryEnumerationOptions)mask errorHandler:(BOOL (^)(NSURL *url, NSError *error))handler {
    
    NSError *e = nil;
#define _NSFileManager_handleError \
if (e && handler) {\
handler(fileURL, e);\
e = nil;\
}
    
    NSMutableArray *fileArray = [NSMutableArray array];
    
    NSDirectoryEnumerator *dirEnumerator = [self enumeratorAtURL:directory includingPropertiesForKeys:@[NSURLNameKey, NSURLIsDirectoryKey] options:mask errorHandler:handler];
    for (NSURL *fileURL in dirEnumerator) {
        NSNumber *isDirectory;
        [fileURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&e];
        _NSFileManager_handleError
        if ([isDirectory boolValue]) continue;
        
        NSString *fileName = nil;
        [fileURL getResourceValue:&fileName forKey:NSURLNameKey error:&e];
        _NSFileManager_handleError
        
        if (fileTypes.count == 0 || [fileTypes member:[fileName pathExtension]]) {
            [fileArray addObject:fileURL];
        }
    }
    return fileArray;
#undef _NSFileManager_handleError
}

- (long long)fileSizeForPath:(NSString *)path {
    signed long long fileSize = 0;
    if ([self fileExistsAtPath:path]) {
        NSError *error = nil;
        NSDictionary *fileDict = [self attributesOfItemAtPath:path error:&error];
        if (error) {
            return -1;
        }
        
        if (fileDict) {
            fileSize = [fileDict fileSize];
        }
    }
    return fileSize;
}

@end
