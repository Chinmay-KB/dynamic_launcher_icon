import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dynamic_launcher_icon_method_channel.dart';

abstract class DynamicLauncherIconPlatform extends PlatformInterface {
  /// Constructs a DynamicLauncherIconPlatform.
  DynamicLauncherIconPlatform() : super(token: _token);

  static final Object _token = Object();

  static DynamicLauncherIconPlatform _instance = MethodChannelDynamicLauncherIcon();

  /// The default instance of [DynamicLauncherIconPlatform] to use.
  ///
  /// Defaults to [MethodChannelDynamicLauncherIcon].
  static DynamicLauncherIconPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DynamicLauncherIconPlatform] when
  /// they register themselves.
  static set instance(DynamicLauncherIconPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
