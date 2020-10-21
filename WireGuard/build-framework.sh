#!/bin/bash

#### Configuration

# Xcode project configuration
XCODE_PROJECT_PATH="WireGuardGoBridge.xcodeproj"
XCODE_PROJECT_CONFIGURATION="Release"
XCODE_PROJECT_MACOS_SCHEME="WireGuardGoBridgemacOS"
XCODE_PROJECT_IOS_SCHEME="WireGuardGoBridgeiOS"

# Build folders
MACOS_DERIVED_DATA_PATH="./WireGuardGoBridge.build/macos"
IOS_DERIVED_DATA_PATH="./WireGuardGoBridge.build/ios"
IOSSIM_DERIVED_DATA_PATH="./WireGuardGoBridge.build/ios-sim"

# Wireguard-go static library name
LIB_NAME="libwg-go.a"

# XCFramework configuration
XCFRAMEWORK_OUTPUT_PATH="WireGuardGoBridge.build/WireGuardGoBridge.xcframework"
XCFRAMEWORK_HEADERS_PATH="../wireguard-go-bridge/xcframework/Headers"

# Deployment
XCFRAMEWORK_DEPLOY_PATH="./WireGuardGoBridge/WireGuardGoBridge.xcframework"

#### Build wireguard-go

xcodebuild -project "$XCODE_PROJECT_PATH" \
  -configuration "$XCODE_PROJECT_CONFIGURATION" \
  -sdk macosx \
  -scheme "$XCODE_PROJECT_MACOS_SCHEME" \
  -derivedDataPath "$MACOS_DERIVED_DATA_PATH" \
  clean build

xcodebuild -project "$XCODE_PROJECT_PATH" \
  -configuration "$XCODE_PROJECT_CONFIGURATION" \
  -sdk iphoneos \
  -scheme WireGuardGoBridgeiOS \
  -derivedDataPath "$IOS_DERIVED_DATA_PATH" \
  clean build

xcodebuild -project "$XCODE_PROJECT_PATH" \
  -configuration "$XCODE_PROJECT_CONFIGURATION" \
  -sdk iphonesimulator \
  -scheme WireGuardGoBridgeiOS \
  -derivedDataPath "$IOSSIM_DERIVED_DATA_PATH" \
  clean build

if [ -d "$XCFRAMEWORK_OUTPUT_PATH" ]; then
  rm -rf "$XCFRAMEWORK_OUTPUT_PATH"
fi

#### Build XCFramework

xcodebuild -create-xcframework \
  -library "$MACOS_DERIVED_DATA_PATH/Build/Products/Release/$LIB_NAME" \
  -headers "$XCFRAMEWORK_HEADERS_PATH" \
  -library "$IOS_DERIVED_DATA_PATH/Build/Products/Release-iphoneos/$LIB_NAME" \
  -headers "$XCFRAMEWORK_HEADERS_PATH" \
  -library "$IOSSIM_DERIVED_DATA_PATH/Build/Products/Release-iphonesimulator/$LIB_NAME" \
  -headers "$XCFRAMEWORK_HEADERS_PATH" \
  -output "$XCFRAMEWORK_OUTPUT_PATH"

#### Deploy

if [ -d "$XCFRAMEWORK_DEPLOY_PATH" ]; then
  rm -rf "$XCFRAMEWORK_DEPLOY_PATH"
fi

cp -R "$XCFRAMEWORK_OUTPUT_PATH" "$XCFRAMEWORK_DEPLOY_PATH"
