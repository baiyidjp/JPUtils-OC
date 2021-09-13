//
// Created by SteyDong on 2021/1/21.
//

#import <Foundation/Foundation.h>


@interface JPTimerUtils : NSObject

/**
 启动GCD定时器(Block回调处理事件)

 @param startTime 开始时间
 @param intervalTime 间隔时间 > 0
 @param repeats 是否重复执行 = NO 只执行一次(此时intervaltime无用)
 @param async 是否是异步
 @param task 处理事件回调
 @return 当前定时器的唯一标识
 */
+ (NSString *)jp_timerBeginWithStartTime:(NSTimeInterval)startTime
                            intervalTime:(NSTimeInterval)intervalTime
                                 repeats:(BOOL)repeats
                                   async:(BOOL)async
                                    task:(void(^)(void))task;

/**
 启动GCD定时器(SEL处理事件)

 @param startTime 开始时间
 @param intervalTime 间隔时间 > 0
 @param repeats 是否重复执行 = NO 只执行一次(此时intervalTime无用)
 @param async 是否是异步
 @param target 消息接收者
 @param selector 方法名
 @return 当前定时器的唯一标识
 */
+ (NSString *)jp_timerBeginWithStartTime:(NSTimeInterval)startTime
                            intervalTime:(NSTimeInterval)intervalTime
                                 repeats:(BOOL)repeats
                                   async:(BOOL)async
                                  target:(id)target
                                selector:(SEL)selector;

/**
 取消定时器

 @param name 要取消的定时器的唯一标识
 */
+ (void)jp_cancelTask:(NSString *)name;

/**
 检查指定的定时器是否在运行

 @param name 定时器标识
 @return 结果
 */
+ (BOOL)jp_checkTimerRun:(NSString *)name;


@end
