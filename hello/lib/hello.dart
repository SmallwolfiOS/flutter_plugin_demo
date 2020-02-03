import 'dart:async';

import 'package:flutter/services.dart';

class Hello {
  static const MethodChannel _channel =
      const MethodChannel('hello');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  //这个是直接从flutter层面封装，不需要channel进行桥接
  static int calculate (int a, int b){
    return a + b;
  }

}
