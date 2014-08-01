//
//  HTTPClient.h
//  moshTickets
//
//  Created by 魔时网 on 13-11-14.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerRequest.h"   
#import "CacheHanding.h"
#import "UIImageView+AFNetworking.h"
#import "URLDefine.h"

#define NOTI_INVIALIDTOKEN      @"NOTI_INVALIDTOKEN"

typedef enum{
    ErrorCode_noUser =              1,//用户不存在
    ErrorCode_invalidToken =        2,//登陆超时
    ErrorCode_loginError =          3,//用户账号或密码错误
} ErrorCode;

typedef void (^Success)(id jsonData);

@interface HTTPClient : NSObject

@property (nonatomic, strong) ServerRequest *request;



/*
 单例
 */
+ (HTTPClient *) shareHTTPClient;

//列表解析
- (NSArray *) listAnalyze:(id) jsonData Key:(NSString *)key;

//dic解析
- (NSDictionary *) infoAnalyze:(id) jsonData Key:(NSString *)key;

///*
// 登录
// name 用化名
// password 密码
// */
//- (void) testWithUserName:(NSString *)userName
//                  password:(NSString *)password
//                   success:(void (^)(id jsonData))success
//                      fail:(void (^)(void))fail;
//

@end