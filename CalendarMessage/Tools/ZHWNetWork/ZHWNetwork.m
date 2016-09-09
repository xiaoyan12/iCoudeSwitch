    //
//  ZHWNetwork.m
//  CalendarMessage
//
//  Created by 刘斌 on 16/8/29.
//  Copyright © 2016年 lb. All rights reserved.
//

#import "ZHWNetwork.h"
#import "AFNetworking.h"
#import "ServerResponseModel.h"
#import "ZHWEventTool.h"
#import "HeartbeatModel.h"
#import "Rc4.h"
#import <CommonCrypto/CommonDigest.h>


//static NSInteger const kRequestTimeIntervalSecond = 40;//循环请求间隔
static NSInteger const kRequestTimeOutSecond      = 15;//超时
static AFHTTPSessionManager *manager = nil;


@implementation ZHWNetwork{
    NSString *statusString;
    NSInteger kRequestTimeIntervalSecond;
    NSInteger createTime;
    BOOL hasSend;
    NSTimer *myTimer;
    NSInteger accountSwitches;
}

+ (instancetype)shareInstance{
    __strong static ZHWNetwork *netWork = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWork = [[ZHWNetwork alloc] init];
    });
    return netWork;
}

- (instancetype)init{
    if (self = [super init]) {
        manager = [[AFHTTPSessionManager alloc]init];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer.timeoutInterval = kRequestTimeOutSecond;
        kRequestTimeIntervalSecond = 30;
        createTime = 0;
        NSLog(@"%@",[self getIdentifier]);
    }
    return self;
}

- (void)requestData:(NSString *)path params:(NSDictionary *)params completion:(void (^)(id JSONObject))completion {
    if (_isGetRequest) {
        [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (task.response.expectedContentLength) {
                NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (completion) {
                    completion(result);
                }
            }

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) {
                completion(@{@"errorMsg":error.localizedDescription});
            }
        }];
    }
    else{
        [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (task.response.expectedContentLength) {
                NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (completion) {
                    completion(result);
                }
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completion) {
                completion(@{@"errorMsg":error.localizedDescription});
            }
        }];
    }
    
}

//复制
- (void)_pasteString:(NSString *)string{
    NSPasteboard *paste = [NSPasteboard generalPasteboard];
    [paste clearContents];
    [paste declareTypes:[NSArray arrayWithObject:NSStringPboardType]owner:self];
    [paste setString:string forType:@"NSStringPboardType"];
}

//设置applescript脚本
-(void)setUpTheAppleScript:(NSString *)scriptName{
    NSTask *task = nil;
    
    NSString *scriptPath = [[NSBundle mainBundle]pathForResource:scriptName ofType:@"scpt"];
    if (scriptPath)
    {
        NSArray *a = [NSArray arrayWithObjects:scriptPath,  nil];
        task = [NSTask launchedTaskWithLaunchPath:@"/usr/bin/osascript" arguments:a];
    }
}




- (ServerResponseModel *)serverResponseHandle:(NSDictionary *)JSONObject ResultType:(ServerResponseResultType)type ModelClass:(NSString *)className{
    return [[ServerResponseModel alloc]initWithServerResponse:JSONObject ResultType:type ModelClassName:className];
}

//开始循环请求
- (NSString *)startRequestLoop{
    NSInteger interval = (arc4random() % 60) + 30;
    myTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(_RequestLoop) userInfo:nil repeats:YES];
    return statusString;
}


- (void)_RequestLoop{
    [self keepRequestLoop];
}

- (void)upLoadAppleIDs{
    //上传结果
    __weak typeof(self )weakSelf = self;
    [[ZHWEventTool defaultEventTool]getRealAppleIDs:^(NSArray *resultArray) {
        
        //rc4加密
//        NSString *rc4Str = [Rc4 HloveyRC4:[self toJSONData:resultArray] key:@"zuhaowan"];
//        NSLog(@"秘文 %@",rc4Str);
            // upload
        [weakSelf requestData:@"http://www.zuhaowan.com/ClientApi/IOS/getResult" params:@{@"appleId":resultArray} completion:^(id JSONObject) {

        }];
    }];

}

//更换账号请求
- (void)changeID{
  //  if (accountSwitches == 2) {
    [self setUpTheAppleScript:@"quit"];
    //关闭定时器
    [myTimer setFireDate:[NSDate distantFuture]];
    
    NSLog(@"长连接已暂停...更换账号中...");
    __weak typeof(self )weakSelf = self;
    [[ZHWNetwork shareInstance]requestData:@"http://www.zuhaowan.com/ClientApi/IOS/changeAccount" params:@{@"key":[self getIdentifier]} completion:^(id JSONObject) {
        NSLog(@"更换账号 %@",JSONObject);
        NSDictionary *dict = (NSDictionary *)JSONObject;
        NSDictionary *result = [dict objectForKey:@"content"];
        //[weakSelf passValueToAppleScript:result[@"account"] andPassword:result[@"password"]];
        //[weakSelf setUpTheAppleScript:@"changeID"];
        
        [weakSelf passValueToAppleScript:result[@"account"] andPassword:result[@"password"]];
       // [weakSelf setUpTheAppleScript:@"apple"];
    }];

    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:240];
      //  accountSwitches = 0;
   // }
}

- (void)delayMethod{
    [myTimer setFireDate:[NSDate distantPast]];
    NSLog(@"长连接恢复....");
}



#pragma mark - 接口解析
//保持长连接接口
- (void)keepRequestLoop{
    [self requestData:@"http://www.zuhaowan.com/ClientApi/IOS/keeplived" params:@{@"key":[self getIdentifier]} completion:^(id JSONObject) {
        HeartbeatModel *result = [HeartbeatModel objectWithKeyValues:JSONObject];
        NSLog(@"保持长连接 %@",JSONObject);
        kRequestTimeIntervalSecond = result.interval;
        if (createTime < 1) {
            [[ZHWEventTool defaultEventTool]createEventWithContent:result.content local:nil];
        }
        switch (result.flag) {
            case 0:
            {
                //waiting...
                [self setUpTheAppleScript:@"quit"];
            }
                break;
            case 1:
            {
                NSString *arcStr = [self ret8bitString];
                [[ZHWEventTool defaultEventTool]createEventWithContent:[NSString stringWithFormat:@"%@[%@]",result.content,arcStr] local:nil];
                [self _pasteString:[self _getPasteString:result.email]];
                [self setUpTheAppleScript:@"sending"];
                [self setUpTheAppleScript:@"AppleScript脚本"];
                
//                accountSwitches ++;
//                [self changeID];
            }
                break;
            case 2:
            {
                //uploading...
                [self upLoadAppleIDs];
                
            }
                break;
            case 3:
            {
                NSLog(@"更换账号");
                //uploading...
                [self setUpTheAppleScript:@"quit"];
                [self changeID];
                
            }
                break;
                
            default:
                break;
        }
    }];
    createTime ++;
}


#pragma mark - 私有方法
//oc as 传参
- (void)passValueToAppleScript:(NSString *)Id andPassword:(NSString *)password{
    NSTask *task = nil;
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"apple" ofType:@"scpt" inDirectory:nil];
    if (scriptPath){
        NSArray *a = [NSArray arrayWithObjects:scriptPath,Id, password, nil];
        task = [NSTask launchedTaskWithLaunchPath:@"/usr/bin/osascript" arguments:a];
        NSLog(@"%@",task);
    }
}

//粘贴板 邮箱处理
- (NSString *)_getPasteString:(NSArray *)array{
    NSMutableString *pasteStr = [NSMutableString string];
    for (int i = 0; i < array.count; i++) {
        NSString *str = array[i];
        if (str.length) {
            [pasteStr appendString:[NSString stringWithFormat:@",%@",array[i]]];
        }
    }
    if ([pasteStr hasPrefix:@","]) {
        NSString *relust = [pasteStr substringFromIndex:1];
        return relust;
    }
    return pasteStr;
}

- (NSString *)toJSONData:(id)theData{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonStr = nil;
    if ([jsonData length] > 0 && error == nil){
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonStr;
}

//获取唯一标示
- (NSString *)getIdentifier{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/sbin/ioreg"];
    
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-rd1", @"-c",@"IOPlatformExpertDevice",nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    
    NSString *key = @"IOPlatformSerialNumber";
    
    NSRange range = [string rangeOfString:key];
    
    NSInteger location = range.location + [key length]+5;
    NSInteger length = 12;
    range.location = location;
    range.length = length;
    
    NSString *UUID = [string substringWithRange:range];
    
    return UUID;
}

- (NSString *)ret8bitString{
    
    char data[8];
    
    for (int x=0;x<8;data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    NSString *str = [[NSString alloc] initWithBytes:data length:8 encoding:NSUTF8StringEncoding];
    
    return [str stringByAppendingString:[NSString stringWithFormat:@"%d",arc4random()%999]];
    
}

@end
