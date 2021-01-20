//
//  JPDateUtils.m
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "JPDateUtils.h"
#import "JPStringUtils.h"
#import "JPUtilsConfig.h"

@implementation JPDateUtils

+ (NSTimeInterval)jp_currentTimeStamp {

    return [JPDateUtils jp_currentTimeStampSecond] * 1000;
}

+ (NSTimeInterval)jp_currentTimeStampSecond {

    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

+ (NSString *)jp_formatTimeStringWithDate:(NSDate *)date {

    return [JPDateUtils jp_formatTimeStringWithDate:date dateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)jp_formatTimeStringWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 判断是否需要多语言
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:JPUtils_Date_CurrentLanguage];
    if ([JPStringUtils jp_stringIsNotNull:language] && [[JPUtilsConfig jp_supportLanguages] containsObject:language]) {
        NSLocale *locale;
        if ([@"zh" isEqualToString:language]) {
            locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        } else {
            locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        }
        dateFormatter.locale = locale;
    }
    dateFormatter.dateFormat = dateFormat;
    NSString *formatTimeString = [dateFormatter stringFromDate:date];
    return formatTimeString;
}

+ (NSTimeInterval)jp_timestampWithGMTTimeString:(NSString *)timeString {

    return [JPDateUtils jp_timestampSecondWithGMTTimeString:timeString] * 1000;
}

+ (NSTimeInterval)jp_timestampSecondWithGMTTimeString:(NSString *)timeString {

    if ([JPStringUtils jp_stringIsNull:timeString]) {
        NSLog(@"%@: 传入GMT时间不存在", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
        return 0;
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    if (timeString.length == 20) {
        dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    }
    [formatter setDateFormat: dateFormat];
    NSDate *date = [formatter dateFromString:timeString];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

+ (NSString *)jp_formatTimeWithGMTTimeString:(NSString *)timeString {

    NSTimeInterval timeInterval = [JPDateUtils jp_timestampWithGMTTimeString:timeString];
    return [JPDateUtils jp_formatTimeStringWithTimestamp:timeInterval];
}

+ (NSString *)jp_formatTimeWithGMTTimeString:(NSString *)timeString dateFormat:(NSString *)dateFormat {
    NSTimeInterval timeInterval = [JPDateUtils jp_timestampWithGMTTimeString:timeString];
    return [JPDateUtils jp_formatTimeStringWithTimestamp:timeInterval dateFormat:dateFormat];
}

+ (NSString *)jp_formatTimeStringWithTimestamp:(NSTimeInterval)timestamp {

    return [JPDateUtils jp_formatTimeStringWithTimestamp:timestamp dateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)jp_formatTimeStringWithTimestamp:(NSTimeInterval)timestamp dateFormat:(NSString *)dateFormat {

    if (!timestamp) {
        NSLog(@"%@: 传入的timestamp不存在", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
        return @"";
    }

    // 判断timestamp是否为毫秒值，不是的返回空
    if ([NSString stringWithFormat:@"%f", timestamp].length <= 10) {
        NSLog(@"%@: 传入的timestamp不是毫秒", [[NSString stringWithUTF8String:__FILE__] lastPathComponent]);
        return @"";
    }

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp / 1000];

    return [JPDateUtils jp_formatTimeStringWithDate:date dateFormat:dateFormat];
}

+ (NSString *)jp_formatTimeStringWithTimestampString:(NSString *)timestampString {

    return [JPDateUtils jp_formatTimeStringWithTimestampString:timestampString dateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)jp_formatTimeStringWithTimestampString:(NSString *)timestampString dateFormat:(NSString *)dateFormat {

    NSTimeInterval timeInterval = (NSTimeInterval)[timestampString doubleValue];
    return [JPDateUtils jp_formatTimeStringWithTimestamp:timeInterval dateFormat:dateFormat];
}

@end
