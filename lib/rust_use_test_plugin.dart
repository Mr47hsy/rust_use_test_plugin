import 'dart:ffi';

import 'package:ffi/ffi.dart';

typedef hello_world_c = Pointer<Utf8> Function(Pointer<Utf8>);

typedef free_c = Pointer<Void> Function(Pointer<Utf8>);

class RustUseTestPlugin {
  DynamicLibrary _rustLib;
  //这里有一点问题 在调用rust的free方法之前 Dart的GC有可能提前释放了内存 导致重复释放发生。
  Pointer<Utf8> _wordPointer;

  RustUseTestPlugin({String libName="libcallrust.so"}) {
    _rustLib = DynamicLibrary.open(libName);
  }

  String helloWorld(String s) {
    hello_world_c helloWorldFun = _rustLib
        .lookup<NativeFunction<hello_world_c>>("hello_world")
        .asFunction<hello_world_c>();
    _wordPointer = helloWorldFun(Utf8.toUtf8(s));
    return Utf8.fromUtf8(_wordPointer);
  }

  //在window平台表现没有问题 但是到了Android会发生重复释放异常
  close() {
    free_c freeFun = _rustLib
        .lookup<NativeFunction<free_c>>("free")
        .asFunction<free_c>();
    freeFun(_wordPointer);
  }
}
