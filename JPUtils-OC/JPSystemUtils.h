//
// Created by SteyDong on 2021/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *JPSystemUtils_UDID = @"JPSystemUtils_UDID";

@interface JPSystemUtils : NSObject

/**
 * 打开系统的URL
 * @param url
 */
+ (void)jp_openSystemURL:(NSURL *)url;

/**
 * 打开当前App的设置页面
 */
+ (void)jp_openSystemSettingsPage;

/**
 * 获取当前设备的UDID
 * @return
 */
+ (NSString *)jp_deviceUDID;

/**
 * 当前网络环境是否为VPN
 * @return
 */
+ (BOOL)jp_isVPNConnected;

/**
 * 获取window窗口
 * @return
 */
+ (UIWindow *)jp_keyWindow;

/*
 * 手机系统版本 13.0
 * */
+ (NSString *)jp_deviceVersion;
/*
 * App版本 2.7.0
 * */
+ (NSString *)jp_appVersion;
/*
 * AppBundleId com.stey.app
 * */
+ (NSString *)jp_appBundleId;
/*
 * AppBuildId 20191104001
 * */
+ (NSString *)jp_appBuildId;
/*
 * 手机型号
 * */
+ (NSString *)jp_deviceModel;

@end