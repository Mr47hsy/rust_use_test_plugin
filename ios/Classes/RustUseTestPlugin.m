#import "RustUseTestPlugin.h"
#if __has_include(<rust_use_test_plugin/rust_use_test_plugin-Swift.h>)
#import <rust_use_test_plugin/rust_use_test_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "rust_use_test_plugin-Swift.h"
#endif

@implementation RustUseTestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRustUseTestPlugin registerWithRegistrar:registrar];
}
@end
