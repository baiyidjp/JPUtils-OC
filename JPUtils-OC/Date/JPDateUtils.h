//
//  JPDateUtils.h
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JPDateUtils : NSObject

/**
 * 返回当前时间的时间戳(毫秒)
 * @return 时间戳
 */
+ (NSTimeInterval)jp_currentTimeStamp;

/**
 * 返回当前时间的时间戳(秒)
 * @return 时间戳
 */
+ (NSTimeInterval)jp_currentTimeStampSecond;

/**
 * 根据NSDate返回格式化时间字符串，默认的格式为(yyyy-MM-dd HH:mm:ss)
 * @param date date
 * @return 格式化时间字符串
 */
+ (NSString *)jp_formatTimeStringWithDate:(NSDate *)date;

/**
 * 根据NSDate返回格式化时间字符串
 * @param date date
 * @param dateFormat 时间格式
 * @return 格式化时间字符串
 */
+ (NSString *)jp_formatTimeStringWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat;

/**
 * 根据GMT时间格式获得时间戳(毫秒)
 * @param timeString GMT
 * @return 时间戳
 */
+ (NSTimeInterval)jp_timestampWithGMTTimeString:(NSString *)timeString;

/**
 * 根据GMT时间格式获得时间戳(秒)
 * @param timeString GMT
 * @return 时间戳
 */
+ (NSTimeInterval)jp_timestampSecondWithGMTTimeString:(NSString *)timeString;

/**
 * 根据格林威治时间，获取格式化时间，默认的格式为(yyyy-MM-dd HH:mm:ss)
 * @param timeString GMT
 * @return 格式化时间字符串
 */
+ (NSString *)jp_formatTimeWithGMTTimeString:(NSString *)timeString;

/**
 * 根据格林威治时间，获取格式化时间
 * @param timeString GMT
 * @param dateFormat 格式
 * @return 格式化时间字符串
 */
+ (NSString *)jp_formatTimeWithGMTTimeString:(NSString *)timeString dateFormat:(NSString *)dateFormat;

/**
 * 根据时间戳返回格式化时间字符串，默认的格式为(yyyy-MM-dd HH:mm:ss)
 * @param timestamp 时间戳(毫秒)
 * @return 时间字符串
 */
+ (NSString *)jp_formatTimeStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 * 根据时间戳返回格式化时间字符串
 * @param timestamp 时间戳(毫秒)
 * @param dateFormat 时间格式
 * @return 时间字符串
 */
+ (NSString *)jp_formatTimeStringWithTimestamp:(NSTimeInterval)timestamp dateFormat:(NSString *)dateFormat;

/**
 * 根据时间戳返回格式化时间字符串，默认的格式为(yyyy-MM-dd HH:mm:ss)
 * @param timestampString 字符串时间戳(毫秒)
 * @return 时间字符串
 */
+ (NSString *)jp_formatTimeStringWithTimestampString:(NSString *)timestampString;

/**
 * 根据时间戳返回格式化时间字符串
 * @param timestampString 字符串时间戳(毫秒)
 * @param dateFormat 时间格式
 * @return 时间字符串
 */
+ (NSString *)jp_formatTimeStringWithTimestampString:(NSString *)timestampString dateFormat:(NSString *)dateFormat;

@end

NS_ASSUME_NONNULL_END
