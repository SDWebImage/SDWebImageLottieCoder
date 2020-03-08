# SDWebImageLottieCoder

[![CI Status](https://img.shields.io/travis/SDWebImage/SDWebImageLottieCoder.svg?style=flat)](https://travis-ci.org/SDWebImage/SDWebImageLottieCoder)
[![Version](https://img.shields.io/cocoapods/v/SDWebImageLottieCoder.svg?style=flat)](https://cocoapods.org/pods/SDWebImageLottieCoder)
[![License](https://img.shields.io/cocoapods/l/SDWebImageLottieCoder.svg?style=flat)](https://cocoapods.org/pods/SDWebImageLottieCoder)
[![Platform](https://img.shields.io/cocoapods/p/SDWebImageLottieCoder.svg?style=flat)](https://cocoapods.org/pods/SDWebImageLottieCoder)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/SDWebImage/SDWebImageLottieCoder)

## What's for

This is a coder plugin for [Lottie Animation format](https://airbnb.design/lottie/).

## Differences 

We've already built one Lottie plugin, called [SDWebImageLottiePlugin](https://github.com/SDWebImage/SDWebImageLottiePlugin).

The main difference for this two components, it's `How we play animation`, and `The dependency we use`.

### SDWebImageLottiePlugin

This lottie framework dependent [lottie-ios](https://github.com/airbnb/lottie-ios), which is maintained by Airbnb, This plugin can only play animation by using their own `LOTAnimationView`.

Pros: It use vector rendering technology like Core Animation Layer, which means you can change your view dynamic size without lossing details or regenerate images.

Cons: Vector rendering is much slower than bitmap rendering. For small and massive lottie images, like emojis, small icons, this is not suitable.

### SDWebImageLottieCoder

This lottie framework dependent [rlottie](https://github.com/Samsung/rlottie), which is maintained by Samsung.

Pros: It use bitmap rendering, which means it can be played on [SDAnimatedImageView](https://github.com/SDWebImage/SDWebImage/wiki/Advanced-Usage#animated-image-50), or even normal UIImageView. You can also preload all frames into memory, to get the best performance and 60FPS. This is also easy to integrate to UIKit/AppKit native framework.

Cons: Bitmap rendering does not support dynamic size changes. Once you want larger images, you need re-decoding the source lottie JSON, which is time-consuming and RAM consuming.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

#### CocoaPods
SDWebImageLottieCoder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDWebImageLottieCoder'
```

#### Carthage

SDWebImageLottieCoder is available through [Carthage](https://github.com/Carthage/Carthage).

```
github "SDWebImage/SDWebImageLottieCoder"
```

#### Swift Package Manager (Xcode 11+)

SDWebImageLottieCoder is available through [Swift Package Manager](https://swift.org/package-manager).

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageLottieCoder.git", from: "0.1")
    ]
)
```

SDWebImageLottieCoder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDWebImageLottieCoder'
```

## Author

DreamPiggy, lizhuoli1126@126.com

## License

SDWebImageLottieCoder is available under the MIT license. See the LICENSE file for more info.

## Thanks

+ [rlottie](https://github.com/Samsung/rlottie)