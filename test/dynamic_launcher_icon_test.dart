import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_launcher_icon/dynamic_launcher_icon.dart';
import 'package:dynamic_launcher_icon/dynamic_launcher_icon_platform_interface.dart';
import 'package:dynamic_launcher_icon/dynamic_launcher_icon_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDynamicLauncherIconPlatform 
    with MockPlatformInterfaceMixin
    implements DynamicLauncherIconPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DynamicLauncherIconPlatform initialPlatform = DynamicLauncherIconPlatform.instance;

  test('$MethodChannelDynamicLauncherIcon is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDynamicLauncherIcon>());
  });

  test('getPlatformVersion', () async {
    DynamicLauncherIcon dynamicLauncherIconPlugin = DynamicLauncherIcon();
    MockDynamicLauncherIconPlatform fakePlatform = MockDynamicLauncherIconPlatform();
    DynamicLauncherIconPlatform.instance = fakePlatform;
  
    expect(await dynamicLauncherIconPlugin.getPlatformVersion(), '42');
  });
}
