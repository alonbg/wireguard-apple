#!/bin/bash

xcodebuild -project WireGuardGoBridge.xcodeproj \
  -configuration Release \
  -sdk macosx \
  -scheme WireGuardGoBridgemacOS \
  clean build \
  CONFIGURATION_BUILD_DIR=./build/wg-go-bridge-mac.out

# xcodebuild -project WireGuardGoBridge.xcodeproj \
#   -configuration Release \
#   -sdk iphoneos \
#   -scheme WireGuardGoBridgeiOS \
#   CONFIGURATION_BUILD_DIR=./build/wg-go-bridge-ios.out \
#   BUILD_LIBRARY_FOR_DISTRIBUTION=YES

if [ -d ./build/WireGuardGoBridge.xcframework ]; then
  rm -rf ./build/WireGuardGoBridge.xcframework
fi

xcodebuild -create-xcframework -library ./build/wg-go-bridge-mac.out/libwg-go.a \
  -headers ../wireguard-go-bridge/xcframework/Headers \
  -output ./build/WireGuardGoBridge.xcframework

# Copy ./build/WireGuardGoBridge.xcframework to ./WireGuardGoBridge/WireGuardGoBridge.xcframework
