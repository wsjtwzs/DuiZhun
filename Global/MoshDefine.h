//
//  MoshDefine.h
//  modelTest
//
//  Created by mosh on 13-10-21.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <Foundation/Foundation.h>


//百度appid
#define APPKEY_BAIDU        @"bAKHghmenagZl0mamcEUxNcD"
#define APPSECRET_BAIDU     @"2qVZKfjb3l3xp3BqXPPh6ZMmudHntNeH"

//微信
#define APPID_WEIXIN        @"wx8f059b5aaa2473ce"

//基点
#define POINT_X     0
#define POINT_Y     0

//宏定义NSLog

#define _DEBUG

#ifdef	_DEBUG
#define	MOSHLog(...);	NSLog(__VA_ARGS__);
#define	MOSHDUGLog(object) 	[NSLogView moshLogInLogView:[object description]]
#define MOSHLogMethod	NSLog( @"[%s] %@", class_getName([self class]), NSStringFromSelector(_cmd) );
#else
#define MOSHLog(...);
#define	MOSHDUGLog(object)
#define MOSHLogMethod
#endif

//宏定义屏幕的宽和高

#define SCREENWIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT    [UIScreen mainScreen].bounds.size.height
#define NAVHEIGHT       ([GlobalConfig versionIsIOS7]? 64 : 44)
#define NAVIMAGE       ([GlobalConfig versionIsIOS7]? @"navBg_ios7" : @"navBg")
#define STATEHEIGHT     ([GlobalConfig versionIsIOS7]? 0 : 20)
#define TABBARHEIGHT    49


//解决arc中performselector警告问题
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

//全局字体
#define GLOBAL_FONT                 [UIFont fontWithName:@"HiraKakuProN-W3" size:15]

//宏定义颜色
#define NORMAL_COLOR				[UIColor colorWithRed:151/255.0f green:151/255.0f blue:151/255.0f alpha:1]

#define CLEARCOLOR              [UIColor clearColor]
#define WHITECOLOR              [UIColor whiteColor]
#define BLACKCOLOR              [UIColor blackColor]

#define YELLOWCOLOR             [UIColor yellowColor]

#define NAVBAR_TINT_COLOR			[UIColor colorWithRed:44/255.0f green:44/255.0f blue:44/255.0f alpha:1]

#define TEXTGRAYCOLOR               [UIColor colorWithRed:183/255.0f green:183/255.0f blue:183/255.0f alpha:1]
#define BLUECOLOR               [UIColor colorWithRed:0/255.0f green:126/255.0f blue:201/255.0f alpha:1]
#define BACKGROUND              [UIColor whiteColor]
#define  rowGrayColor [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1]

//图片
#define PLACEHOLDERIMAGE_VERTICAL        [UIImage imageNamed:@"vertical_pic@2x.png"]
#define PLACEHOLDERIMAGE_HORIZONTAL  [UIImage imageNamed:@"horizontal_pic@2x.png"]
#define PLACEHOLDERIMAGE_SQUARE      [UIImage imageNamed:@"square_pic@2x.png"]
//

#define iPodTouchString				@"iPod touch"
#define iPadString                  @"iPad"
#define DeviceType                  @"设备类型"
#define System                      @"系统版本"

#define CURRENTAPPID                @""//用于评分

#define NAV_FONT                    [UIFont systemFontOfSize:20];
#define BUTTON_FONT                 [UIFont boldSystemFontOfSize:13];

#define NSArrayClass                [NSArray class]
#define NSDictionaryClass           [NSDictionary class]
#define NSStringClass               [NSString class]
#define USERDEFAULT                 [NSUserDefaults standardUserDefaults]
#define OBJECTOFUSERDEFAULT(object) [NSUserDefaults standardUserDefaults] objectForKey:object]
#define NOTIFICATIONCENTER           [NSNotificationCenter defaultCenter]
#define USERDEFAULT                  [NSUserDefaults standardUserDefaults]

//动画时间
#define DURATION                    0.7
#define ANIMATIONTYPE_PUSH          3
#define ANIMATIONSUBTYPE_PUSH       2
#define ANIMATIONTYPE_POP           3
#define ANIMATIONSUBTYPE_POP        1


#define LOADING						@"正在加载..."
#define LOADINGMORE                 @"正在加载更多内容"
#define ERROR_LOADFAIL               @"网络连接失败，请重试。"
#define ERROR_LOADFAIL2           @"加载失败，请检查网络连接"
#define ERROR_READCACHE             @"加载失败，读取缓存..."
#define ERROR_EMPTYDATA             @"内容暂未更新，不要着急哦~~"

#define ALERT_PHONE_EMPTY            @"手机号不能为空"
#define ALERT_PHONE_ERROR            @"手机号不正确"

#define ALERT_EMAIL_EMPTY            @"邮箱不能为空"
#define ALERT_EMAIL_ERROR            @"邮箱格式不正确"

#define ALERT_USERNAME_EMPTY         @"用户名不能为空"
#define ALERT_PASSWORD_EMPTY         @"密码不能为空"
#define ALERT_PASSWORD_UNEQUAL       @"两次输入的密码不一致，请重新输入"

#define ERROR_LOGINFAIL             @"登录失败，请检查用户名和密码"
#define ERROR_LOGINFAIL2            @"用户名不存在"
#define ERROR_LOGINFAIL3            @"请求失败，请检查用户名"
#define ERROR_LOGINFAIL4             @"登录失败，请检查密码格式"


#define ALERT_CHECKNUMBER           @"验证码已发送，请注意手机查收"
#define ALERT_PASSWORD              @"密码最少为6位，请重新设置密码"
#define ALERT_PASSWORDSUC           @"密码重置成功"
#define ALERT_IMAGEPICKER       @"获取失败，请在[设置]->[隐私]->[照片]->[活动易]，打开照片访问！"


#define ALERT_INVALIDTOKEN          @"登录时长超过有效期，请重新登录"
#define ALERT_SAVEFAILED            @"保存失败，请重新保存"
#define ALERT_BINGDINGGPSNUMBER     @"设备已绑定其他车辆，请解绑后再绑定或更换其他设备号"
#define ALERT_EXISTCARNUMBER        @"车牌号已存在，请重新输入"
#define ALERT_EXISTUSER              @"用户已存在，请更换用户名"
#define ALERT_UNEXISTCAR            @"车辆不存在"
#define ALERT_UNEXISTGPSNUMBER      @"设备编号不存在，请重新输入"
#define ALERT_GPSNUMBERERROR        @"GPS设备号错误，请重新输入"
#define ALERT_CARISNOTBINDINGGPS    @"车辆没有绑定gps，请至管理页面绑定"
#define ALERT_ARGUMENTERROR         @"信息填写有误，请检查后重新填写"

#define BUTTON_OK					@"确定"
#define BUTTON_CANCEL				@"取消"
#define BUTTON_BACK				@"返回"
#define BUTTON_ALLSELECT				@"全选"
#define BUTTON_ALLDEL               @"全删"

#define UPDATE_TITIE				@"升级提示"
#define NO_NEW_VERSION				@"未发现新版本，当前安装的已是最新版本。"
#define HAS_NEW_VERSION				@"发现新版本，现在是否升级？"

#define kCallNotSupportOnIPod		@"该设备不支持打电话功能！"
#define kSmsNotSupportOnIPod		@"该设备不支持发短信功能！"
#define kOptionNotSupport			@"您的设备不支持该项功能！"
#define ERROR_COLLECT               @"收藏功能需要登录后才能使用！"

#define COLLECT_ADDSUCCESS          @"收藏成功"
#define COLLECT_ADDFAILED           @"收藏失败"
#define COLLECT_DELSUCCESS          @"移除收藏成功"
#define COLLECT_DELFAILED           @"移除收藏失败"
#define DOWN_DELFAILED           @"获取票数据失败"
#define VALIDATE_DELFAILED           @"验票失败"
#define UPLOAD_DELFAILED           @"上传失败"
#define SYNC_ADDSUCCESS           @"同步成功"
#define SYNC_DELFAILED           @"同步失败"

//占位符
#define PLACE_SEARCH                @"请输入查询内容"


//存储
#define USERDEFAULT_AUTOLOGIN       @"autoLogin"
#define USERDEFAULT_RECEIVENOTI   @"receiveNoti"

//用户
#define USER_THIRDNICKNAME          @"userNickName" // 用户昵称
#define USER_USERID                 @"userId"       //用户id
#define USER_USERNAME               @"userName"     //用户名
#define USER_PASSWORD               @"userPassword" //密码
#define USER_PHONE                  @"userPhone"    //手机号
#define USER_EMAIL                  @"userEmail"    //邮箱
#define USER_CITY                   @"userCity"     //城市
#define USER_IMAGE                  @"userImage"    //头像
#define USER_BINDING                @"userBinding"  //绑定
#define USER_GENDER                 @"userGender"   //性别
#define CITYNAME                    @"CityName"     //gps城市名称
#define CITYID                      @"CityId"       //gps城市代码
#define USER_TOKEN                  @"userToken"        //token

//消息
#define NOTI_GESTURE_RIGHT      @"NOTI_GES_RIGHT"
#define NOTI_GESTURE_LEFT       @"NOTI_GES_LEFT"
#define NOTI_NAVBUTTON_PRESS    @"NOTI_NAVBUTTON_PRESS"
#define NOTI_MAIN               @"NOTI_MAIN"
#define NOTI_USER               @"NOTI_USER"
#define NOTI_CONFIG             @"NOTI_CONFIG"
#define NOTI_TARGER             @"NOTI_TARGET"

#define FRAME_MIDDLE    CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)
#define FRAME_RIGHT     CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT)
#define FRAME_LEFT      CGRectMake(-SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT)
#define FRAME_UP        CGRectMake(0, -SCREENHEIGHT, SCREENWIDTH, SCREENHEIGHT)
#define FRAME_DOWN      CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, SCREENHEIGHT)

#define DURATION_NAVVIEW    0.3f
#define DURATION_LOGINVIEW    0.5f



@interface MoshDefine : NSObject

@end
