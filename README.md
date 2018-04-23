![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/logo.png?raw=true)
CuteAttribute
===
[![Build Status](https://travis-ci.org/qiuncheng/CuteAttribute.svg?branch=master)](https://travis-ci.org/qiuncheng/CuteAttribute)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![pod version](https://img.shields.io/cocoapods/v/CuteAttribute.svg)](https://cocoapods.org/pods/CuteAttribute)
[![](https://img.shields.io/badge/Swift-4.0-yellowgreen.svg)](https://github.com/qiuncheng/CuteAttribute)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/qiuncheng/NoticeBar/master/LICENSE)

An elegant way to deal with attributed string in swift. It's convenient to create attributed string by `.cute`, whatever from `String`, `NSString`, `NSAttributedString` or `NSMutableAttributedString`. It's so amazing that almost all methods support `chaining`. I create this project just because I met [Typeset](http://github.com/draveness/typeset) serveral days ago. But I found it's so hard to use by swift. So I made this.

![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/screenshot.png?raw=true)

Support
===
Swift 3.0 & iOS 8+

Installation
===
#### CocoaPods
- add it to your Podfile.

```ruby
pod 'CuteAttribute'
```
- Then run the command.

```shell
pod install
```
- Import the header file in your project.

```swift
import CuteAttribute
```

#### Carthage
- Add CuteAttribute to your Cartfile.

```ruby
github "qiuncheng/CuteAttribute"
```
- Run the command

```shell
carthage update --platform ios
```
- Follow the rest of the [standard Carthage installation](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) instructions to add CuteAttribute to your project.

- Import the header file in your project.

```swift
import CuteAttribute
```

#### Manually
- [Download](https://github.com/qiuncheng/CuteAttribute/archive/master.zip) the full file.
- Drag the CuteAttribute folder to your project.

Usage
===
### Comparison
attribute name | result | NSAttributedString | CuteAttribute
--- | --- | --- | ---
color | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/color.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.foregroundColor: UIColor.red]) | "hello world".cute.matchAll().color(.red)
baselineOffset | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/baselineOffset.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.baselineOffset: 10]) | "hello world".cute.matchAll().baseline(10)
underline | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/underline.png?raw=true) |  NSMutableAttributedString(string: "hello world", attributes: [.underlineColor: UIColor.red, .underlineStyle: NSUnderlineStyle.styleSingle.rawValue]) | "hello world".cute.matchAll().underline(.styleSingle).underlineColor(.red)
font | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/font.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]) | "hello world".cute.matchAll().font(UIFont.systemFont(ofSize: 20))
strikethrough | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/strikethrough.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue, .strikethroughColor: UIColor.red]) | "hello world".cute.matchAll().strikeThrough(.styleSingle).strokeColor(.red)
link | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/link.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.link: "https://blog.vsccw.com"]) | "hello world".cute.matchAll().link("https://blog.vsccw.com")
ligature | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/ligature.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.ligature: 1]) | "hello world".cute.matchAll().ligature(1)
kern | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/kern.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.kern: 10]) | "hello world".cute.matchAll().kern(10)
stroke | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/stroke.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.strokeColor: UIColor.red, .strokeWidth: 10]) | "hello world".cute.matchAll().strokeColor(.red).strokeWidth(10)
shadow | `let shadow = NSShadow(); shadow.shadowColor = UIColor.red; shadow.shadowOffset = CGSize(width: 4, height: 4); shadow.shadowBlurRadius = 10;` ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/shadow.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.shadow: shadow]) | "hello world".cute.matchAll().shadow(shadow)
textEffect | ![no image](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/textEffect.png?raw=true) | "hello world".cute.matchAll().textEffect("NSTextEffectLetterpressStyle") | "hello world".cute.matchAll().textEffect("NSTextEffectLetterpressStyle")
obliqueness | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/obliqueness.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.obliqueness: 10]) | "hello world".cute.matchAll().obliqueness(10)
expansion | ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/expansion.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.expansion: 10]) | "hello world".cute.matchAll().expansion(10)
textAttachment | `let attachment = NSTextAttachment(); attachment.image = UIImage(named: "hello.png");` ![](https://github.com/qiuncheng/CuteAttribute/blob/master/Images/textAttachment.png?raw=true) | NSMutableAttributedString(string: "hello world", attributes: [.attachment: attachment]) | "hello world".cute.matchAll().textAttachment(attachment)

TODO
===
- [x] Documented.
- [x] Example.
- [ ] Test.
- [ ] More convenience.

Thanks
===
[Typeset](http://github.com/draveness/typeset) : Deal with AttributedString efficiently in `Objective-C`.

LICENCE
===
Under [MIT](https://github.com/qiuncheng/CuteAttribute/blob/master/LICENSE) License
