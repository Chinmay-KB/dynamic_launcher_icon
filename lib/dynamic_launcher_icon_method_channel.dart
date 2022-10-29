import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dynamic_launcher_icon_platform_interface.dart';

/// An implementation of [DynamicLauncherIconPlatform] that uses method channels.
class MethodChannelDynamicLauncherIcon extends DynamicLauncherIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dynamic_launcher_icon');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
