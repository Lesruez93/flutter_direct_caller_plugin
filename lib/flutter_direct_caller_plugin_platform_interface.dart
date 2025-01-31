import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_direct_caller_plugin_method_channel.dart';

abstract class FlutterDirectCallerPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterDirectCallerPluginPlatform.
  FlutterDirectCallerPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDirectCallerPluginPlatform _instance = MethodChannelFlutterDirectCallerPlugin();

  /// The default instance of [FlutterDirectCallerPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDirectCallerPlugin].
  static FlutterDirectCallerPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDirectCallerPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterDirectCallerPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
