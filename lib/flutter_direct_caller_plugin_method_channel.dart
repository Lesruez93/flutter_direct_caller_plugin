import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_direct_caller_plugin_platform_interface.dart';

/// An implementation of [FlutterDirectCallerPluginPlatform] that uses method channels.
class MethodChannelFlutterDirectCallerPlugin extends FlutterDirectCallerPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_direct_caller_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
