//
//  NSFileManager+Vanke.h
//  DailyFresh
//
//  Created by Mac on 2019/5/22.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (Vanke)

/**
 *    @brief    文档目录
 *
 *    @return    返回文档的路径
 */
- (NSString *)applicationDocumentsDirectory;

/**
 *    @brief    库目录
 *
 *    @return    返回库路径
 */
- (NSString *)applicationLibraryDirectory;

/**
 *    @brief    音乐目录
 *
 *    @return    返回音乐目录
 */
- (NSString *)applicationMusicDirectory;

/**
 *    @brief    视频目录
 *
 *    @return    返回视频路径
 */
- (NSString *)applicationMoviesDirectory;

/**
 *    @brief    图片路径
 *
 *    @return    返回图片
 */
- (NSString *)applicationPicturesDirectory;

/**
 *    @brief    临时目录
 *
 *    @return    返回临时目录
 */
- (NSString *)applicationTemporaryDirectory;

/**
 *    @brief    缓存目录
 *
 *    @return    返回缓存
 */
- (NSString *)applicationCachesDirectory;

- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)erro;

- (NSArray *)filesInDirectory:(NSURL *)directory withExtensions:(NSSet *)fileTypes directoryEnumerationOptions:(NSDirectoryEnumerationOptions)mask errorHandler:(BOOL (^)(NSURL *url, NSError *error))handler;

/**
 *    @brief    文件大小
 *
 *    @param     path     路径
 *
 *    @return    file size. If the file not exist, the return value will be 0. If error occurs, the return value will be -1.
 */
- (long long)fileSizeForPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
