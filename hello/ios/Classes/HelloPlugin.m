#import "HelloPlugin.h"

@implementation HelloPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"hello"
            binaryMessenger:[registrar messenger]];
  HelloPlugin* instance = [[HelloPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSDictionary *arguments = [call arguments];//这个是flutter端传过来的参数
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"calculate" isEqualToString:call.method]) {
       NSInteger a = [arguments[@"a"] intValue];
       NSInteger b = [arguments[@"b"] intValue];
       result([NSString stringWithFormat:@"%ld", a + b]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
