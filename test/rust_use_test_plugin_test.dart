import 'package:flutter_test/flutter_test.dart';
import 'package:rust_use_test_plugin/rust_use_test_plugin.dart';

void main() {
  test('helloWord', () async {
    RustUseTestPlugin rustUseTestPlugin = new RustUseTestPlugin();
    String out = rustUseTestPlugin.helloWorld("test");
    expect(out, "Hello test Come To New World.");
    rustUseTestPlugin.close();
  });
}
