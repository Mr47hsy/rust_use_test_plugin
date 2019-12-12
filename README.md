# rust_use_test_plugin

A plug-in for testing the flutter invocation of rust.

So far only Android has been tested.

I wrote the automated build script,
currently there is only CMD (init.cmd;build.cmd),
shell will be done quickly.

## Android Depend On
- Android
    - Android API Level 22 Installed
    - NDK 
    - Set Environment Variable ``` $ANDROID_HOME=SDK_Path;$NDK_HOME=SDK_Path/ndk-bundle ```
    
- [Rust](https://www.rust-lang.org/)
    - target add (exec ``` rustup target add ```)
        - aarch64-linux-android
        - armv7-linux-androideabi
        - i686-linux-android
        - x86_64-linux-android
    - cargo-ndk >= 0.5.0  (need cargo first and exec ``` cargo install cargo-ndk ```)
- [Flutter](https://flutter.dev/)
   - [Dart](https://dart.dev/) version >= 2.6
   - Flutter 1.10.x dev channel build (Just exec ``` flutter channel dev ``` and ``` flutter upgrade ```)

## IOS Depend On
soon...

### Easy Load
If you've already installed rust 2018 and the Flutter 1.10.x.Just Exec ``` .\init.cmd ```

## Start
First exec ``` .\build.cmd ``` and run example.Have Fun
