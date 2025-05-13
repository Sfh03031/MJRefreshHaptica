# MJRefreshHaptica

[![CI Status](https://img.shields.io/travis/Sfh03031/MJRefreshHaptica.svg?style=flat)](https://travis-ci.org/Sfh03031/MJRefreshHaptica)
[![Version](https://img.shields.io/cocoapods/v/MJRefreshHaptica.svg?style=flat)](https://cocoapods.org/pods/MJRefreshHaptica)
[![License](https://img.shields.io/cocoapods/l/MJRefreshHaptica.svg?style=flat)](https://cocoapods.org/pods/MJRefreshHaptica)
[![Platform](https://img.shields.io/cocoapods/p/MJRefreshHaptica.svg?style=flat)](https://cocoapods.org/pods/MJRefreshHaptica)

## Introduction

Add haptica feed back during pulling to refresh for MJRefresh by runtime.

(利用runtime为MJRefresh添加下拉刷新过程中的触觉反馈效果。)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 12.0 or later
* Swift 5.9.2
* Xcode 15.1

## Installation

MJRefreshHaptica is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MJRefreshHaptica'
```

If you want to use the latest features of MJRefreshHaptica, use normal external source dependencies.

```ruby

pod 'MJRefreshHaptica', :git => 'https://github.com/Sfh03031/MJRefreshHaptica.git'

```

## Usage

Install and import MJRefreshHaptica

```swift

import MJRefreshHaptica

```

find `didFinishLaunchingWithOptions` method in `AppDelegate.swift` file, add the following code:

```swift

MJRefreshHaptica.default.open(true, style: .light)

```
the `style` property is a case of `HapticFeedbackStyle`:

```swift

public enum HapticFeedbackStyle: Int {
    case light, medium, heavy
    
    @available(iOS 13.0, *)
    case soft, rigid
}

```

It's that simple, enjoy it.

## Contributing

Please make an issue or pull request if you have any request.

Bug reports, Documentation, or tests, are always welcome as well.

## Author

Sfh03031, sfh894645252@163.com

## License

MJRefreshHaptica is available under the MIT license. See the LICENSE file for more info.
