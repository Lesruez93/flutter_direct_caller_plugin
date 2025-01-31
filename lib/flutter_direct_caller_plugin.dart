import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDirectCallerPlugin {
  static const MethodChannel _channel =
  MethodChannel('flutter_direct_caller_plugin');

  static Future<bool?> callNumber(String number) async {
    return await _channel.invokeMethod(
      'callNumber',
      <String, Object>{
        'number': number,
      },
    );
  }
}
