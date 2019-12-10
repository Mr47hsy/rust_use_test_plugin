import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rust_use_test_plugin/rust_use_test_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('rust_use_test_plugin');

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
    expect(await RustUseTestPlugin.platformVersion, '42');
  });
}
