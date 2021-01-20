//
//  JPStringUtils.h
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JPStringUtils : NSObject

/**
 * 判断传入的NSString是否为空或者nil
 * @param string 要判断的string
 * @return Bool
 */
+ (BOOL)jp_stringIsNull:(NSString *)string;

/**
 * 判断传入的NSString是否不为空并且不为nil
 * @param string 要判断的string
 * @return Bool
 */
+ (BOOL)jp_stringIsNotNull:(NSString *)string;

/**
 * 通过NSDictionary获取query字符串
 * @param dictionary dict
 * @return query
 */
+ (NSString *)jp_queryStringWithDictionary:(NSDictionary *)dictionary;

/**
 * 通过query字符串获取NSDictionary
 * @param queryString query
 * @return NSDictionary
 */
+ (NSDictionary *)jp_dictionaryWithQueryString:(NSString *)queryString;

@end

NS_ASSUME_NONNULL_END
