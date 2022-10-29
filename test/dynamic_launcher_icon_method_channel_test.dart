import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_launcher_icon/dynamic_launcher_icon_method_channel.dart';

void main() {
  MethodChannelDynamicLauncherIcon platform = MethodChannelDynamicLauncherIcon();
  const MethodChannel channel = MethodChannel('dynamic_launcher_icon');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
