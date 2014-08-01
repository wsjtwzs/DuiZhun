//
//  HTTPClient.m
//  moshTickets
//
//  Created by 魔时网 on 13-11-14.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "HTTPClient.h"
#import "GlobalConfig.h"


@implementation HTTPClient

+ (HTTPClient *) shareHTTPClient
{
    static HTTPClient *instace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instace = [[HTTPClient alloc] init];
    });
    return instace;
}

- (id) init
{
    if (self = [super init]) {
        self.request = [ServerRequest serverRequest];
    }
    return self;
}

- (NSArray *) listAnalyze:(id) jsonData Key:(NSString *)key
{
    //json格式正确
    if ([GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:jsonData]) {
        
        //成功
        NSNumber *number = [GlobalConfig convertToNumber:jsonData[JSONKEY_SUCCESS]];
        if ([number boolValue] == YES) {
            NSArray *array = [GlobalConfig convertToArray:jsonData[key]];
            return array;
        }
        else {
            NSNumber *errorCode = [GlobalConfig convertToNumber:jsonData[JSONKEY_ERROR]];
            [self errorCode:[errorCode intValue]];
        }
    }
    else {
        [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
    }
    return nil;

}

- (NSDictionary *) infoAnalyze:(id) jsonData Key:(NSString *)key
{
    //json格式正确
    if ([GlobalConfig isKindOfNSDictionaryClassAndCountGreaterThanZero:jsonData]) {
        
        //成功
        NSNumber *number = [GlobalConfig convertToNumber:jsonData[JSONKEY_SUCCESS]];
        if ([number boolValue] == YES) {
            NSDictionary *dic = [GlobalConfig convertToDictionary:jsonData[key]];
            return dic;
        }
        else {
            NSNumber *errorCode = [GlobalConfig convertToNumber:JSONKEY_ERROR];
            [self errorCode:[errorCode intValue]];
        }
    }
    else {
        [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
    }
    return nil;
    
}


- (void) errorCode:(int)code
{
    switch (code) {
            //无效的token
        case ErrorCode_invalidToken:
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_INVIALIDTOKEN object:nil];
            break;
            //登录失败
        case ErrorCode_loginError:
            [GlobalConfig showAlertViewWithMessage:ERROR_LOGINFAIL superView:nil];
            break;
            //没有此用户
        case ErrorCode_noUser:
            [GlobalConfig showAlertViewWithMessage:ERROR_LOGINFAIL2 superView:nil];
            break;
        default:
            [GlobalConfig showAlertViewWithMessage:ERROR_LOADFAIL superView:nil];
            break;
    }
}

//- (void) testWithUserName:(NSString *)userName
//                  password:(NSString *)password
//                   success:(void (^)(id jsonData))success
//                      fail:(void (^)(void))fail
//{
//    [_request beginRequestWithUrl:[NSString stringWithFormat:URL_LOGIN,userName,password]
//                     isAppendHost:YES
//                        isEncrypt:YES
//                          success:success
//                             fail:fail];
//}


@end
