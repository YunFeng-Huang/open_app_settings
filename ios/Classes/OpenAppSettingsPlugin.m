#import "OpenAppSettingsPlugin.h"

@implementation OpenAppSettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"open_app_settings"
            binaryMessenger:[registrar messenger]];
  OpenAppSettingsPlugin* instance = [[OpenAppSettingsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

   
    //   NSURL *url= [NSURL URLWithString:@"prefs:root=WIFI"];
   NSString * urlStr = @"App-Prefs:root";

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {

    NSURL * url = [NSURL URLWithString:urlStr];

    [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:^(BOOL success) {
        result(@"跳转成功");
    }];

    NSLog(@"1112");
    }else{

    NSLog(@"222");
    NSURL * url = [NSURL URLWithString:urlStr];

    [[UIApplication sharedApplication]openURL:url];
     result(@"跳转成功");

    }
}

@end
