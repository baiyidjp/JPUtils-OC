//
//  JPUtilsConfig.h
//  JPUtilsDemo
//
//  Created by SteyDong on 2021/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *JPUtils_Date_CurrentLanguage = @"JPUtils_Date_CurrentLanguage";

@interface JPUtilsConfig : NSObject

/**
 * 当前支持语言
 * @return
 */
+ (NSArray *)jp_supportLanguages;

/**
 * 配置当前设置的语言环境，单语言app忽略
 * @param language 传nil或者'' 则为移除缓存
 */
+ (void)jp_configCurrentLanguage:(NSString *)language;

@end

NS_ASSUME_NONNULL_END
