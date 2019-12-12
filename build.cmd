@echo off
echo ****** START BUILD RUST LIBS ******
echo ****** IT WILL BUILD 6 TYPE LIB (windows_x86_64 for test, android_x86, android_x86_64, android_arm64, android_armv7) ******
echo ****** BUILD WILL AUTOMATIC PUT IN JinLibs ******

goto :Build
:Failed
echo ****** BUILD FAILED ******
pause
exit

:Build
cd rust/lib_test

call cargo build --target-dir=target/windows_x64 --release
call cargo ndk --target i686-linux-android --android-platform 22 -- build --target-dir=target/x86 --release
call cargo ndk --target x86_64-linux-android --android-platform 22 -- build --target-dir=target/x64 --release
call cargo ndk --target aarch64-linux-android --android-platform 22 -- build --target-dir=target/arm64 --release
call cargo ndk --target armv7-linux-androideabi --android-platform 22 -- build --target-dir=target/armv7 --release

set windows_x64_lib_path=%cd%\target\windows_x64\release\callrust.dll
set x86_lib_path=%cd%\target\x86\i686-linux-android\release\libcallrust.so
set x64_lib_path=%cd%\target\x64\x86_64-linux-android\release\libcallrust.so
set arm64_lib_path=%cd%\target\arm64\aarch64-linux-android\release\libcallrust.so
set armv7_lib_path=%cd%\target\armv7\armv7-linux-androideabi\release\libcallrust.so
if not exist %windows_x64_lib_path% goto :Failed
if not exist %x86_lib_path% goto :Failed
if not exist %x64_lib_path% goto :Failed
if not exist %arm64_lib_path% goto :Failed
if not exist %armv7_lib_path% goto :Failed
echo ****** BUILD SUCCEEDED.NOW COPY LIBS ******

cd ./../../
if not exist windows md windows
cd windows
if not exist x64 md x64

cd ./../android/src/main
if not exist jniLibs md jniLibs
cd jniLibs
if not exist arm64-v8a md arm64-v8a
if not exist armeabi md armeabi
if not exist x86 md x86
if not exist x86_64 md x86_64
cd ./../

copy /y %windows_x64_lib_path% .\..\..\..\windows\x64
copy /y %x86_lib_path% jniLibs\x86
copy /y %x64_lib_path% jniLibs\x86_64
copy /y %arm64_lib_path% jniLibs\arm64-v8a
copy /y %armv7_lib_path% jniLibs\armeabi
echo ****** COPY LIBS SUCCEEDED ******
pause


