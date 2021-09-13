//
//  JPStringUtils.m
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import "JPStringUtils.h"

@implementation JPStringUtils

+ (BOOL)jp_stringIsNull:(NSString *)string {

    if (!string || !string.length) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmingString = [string stringByTrimmingCharactersInSet:set];
        if ([trimmingString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

+ (BOOL)jp_stringIsNotNull:(NSString *)string {

    return ![JPStringUtils jp_stringIsNull:string];
}

+ (NSString *)jp_queryStringWithDictionary:(NSDictionary *)dictionary {

    if (dictionary == nil) {
        return nil;
    }
    NSMutableString *string = [NSMutableString string];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"%@=%@&",key,obj];
    }];

    if ([string rangeOfString:@"&"].length) {
        [string deleteCharactersInRange:NSMakeRange(string.length - 1, 1)];
    }

    return string;
}

+ (NSDictionary *)jp_dictionaryWithQueryString:(NSString *)queryString {

    if ([JPStringUtils jp_stringIsNull:queryString]) {
        return nil;
    }

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSArray *queryStrings = [queryString componentsSeparatedByString:@"&"];
    for (NSString *query in queryStrings) {
        if (query && query.length) {
            NSArray *keyValues = [query componentsSeparatedByString:@"="];
            if (keyValues.count == 2) {
                dictionary[keyValues[0]] = keyValues[1];
            }
        }
    }
    return dictionary;
}

@end
