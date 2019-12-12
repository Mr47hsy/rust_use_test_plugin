@echo off
echo ****** Please make sure that ANDROID_HOME and NDK_HOME set up ******
echo ****** Your ANDROID_HOME=%ANDROID_HOME%;NDK_HOME=%NDK_HOME% ******
echo ******
echo If you do not set the environment variables can refer to
echo https://dev.to/robertohuertasm/rust-once-and-share-it-with-android-ios-and-flutter-286o
echo ******
pause
echo ****** SWITCH Flutter Channel dev -- exec 'flutter channel dev' ******
call flutter channel dev || goto flutter_error
echo ****** UPGRADE Flutter -- exec 'flutter upgrade' ******
call flutter upgrade || goto flutter_error
echo ******
echo RUST ADD ANDROID BUILD TARGET
echo -- exec 'rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android x86_64-linux-android'
echo ******
call rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android x86_64-linux-android
echo ****** INSTALL CARGO-NDK FOR ANDROID -- exec 'cargo install cargo-ndk' ******
call cargo install cargo-ndk
echo ****** Environment configuration successful ******
echo ****** Now you want to start building?(Y/N) ******
set /p start=
if %start%==Y (
    call build.cmd
) else (
    if %start%==y call build.cmd
)
echo ****** END ****** && pause && exit

