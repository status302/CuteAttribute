//
//  CuteAttribute+Tap.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/10/8.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import Foundation

/// the tap type matched when you want to use `TapableLabel`.
///
/// - link: url link match, eg: `https://blog.vsccw.com`
/// - phoneNumber: phone number match, eg: `+8617600636630`
/// - custom: custom string match, including regux and origin string, eg: `vsccw`, `^[A-Za-z]+$`.
public enum TapType {
    case link
    case phoneNumber
    case custom(TapCustom)
}

/// use this to custom tap string. regex or string.
///
/// - regex: the regex to match
/// - origin: the origin string to match
public enum TapCustom {
    case regex(String)
    case origin(String)
}

extension CuteAttribute where Base: NSMutableAttributedString {

    /// Set tap action for `UILabel`.
    ///
    /// - Parameter type: CuteAttributeTapType without default value.
    /// - Returns: self
    public func tap(_ type: TapType) -> CuteAttribute<Base> {
        let tapRanges: [NSRange]
        switch type {
        case .link:
            tapRanges = rangesFrom(checkingType: .link)
        case .phoneNumber:
            tapRanges = rangesFrom(checkingType: .phoneNumber)
        case .custom(let tapCustom):
            switch tapCustom {
            case .origin(let originString):
                tapRanges = rangeFrom(string: originString)
            case .regex(let regexString):
                tapRanges = rangesFrom(string: regexString)
            }
        }
        if self.tapRanges.isEmpty {
            self.tapRanges = tapRanges
        } else {
            self.tapRanges.append(contentsOf: tapRanges)
        }

        return self
    }

    /// Set highlight textColor for `UILabel`.
    ///
    /// - Parameter highlight: CuteHighlight , default value is `UIColor.gray`.
    /// - Returns: self
    public func highlight(_ highlight: CuteHighlight = .default) -> CuteAttribute<Base> {
        self.labelHighlight = highlight
        return self
    }

    /// get ranges from `NSTextCheckingResult.CheckingType`, including link or phoneNumber.
    ///
    /// - Parameter checkingType: NSTextCheckingResult.CheckingType.
    /// - Returns: [NSRange]
    internal func rangesFrom(checkingType: NSTextCheckingResult.CheckingType) -> [NSRange] {
        do {
            let dataHelper = try DataDetectorHelper(types: checkingType.rawValue)
            return dataHelper.matches(string: base.string)
        } catch {
            return []
        }
    }

    /// get ranges from special string.
    ///
    /// - Parameter str: String
    /// - Returns: [NSRange]
    internal func rangeFrom(string str: String) -> [NSRange] {
        var range = base.string.lowercased().range(substring: str.lowercased())
        var tapRanges: [NSRange] = []
        assert(range.location != NSNotFound, "Substring must be in string.")
        tapRanges.append(range)
        repeat {
            let location = range.location + range.length
            let length = base.string.length - location
            let allRange = NSRange(location: location, length: length)
            range = base.string.range(substring: str, options: [], range: allRange)
            if range.length == 0 || range.location == NSNotFound {
                break
            }
            tapRanges.append(range)
        } while true
        return tapRanges
    }

    /// get ranges from regex string.
    ///
    /// - Parameter string: regex string
    /// - Returns: [NSRange]
    internal func rangesFrom(string: String) -> [NSRange] {
        do {
            let regex = try RegexHelper(pattern: string)
            return regex.matchs(input: base.string)
        } catch {
            return []
        }
    }

    /// the special tapRanges array.
    internal var tapRanges: [NSRange] {
        get {
            let value = (objc_getAssociatedObject(base, CuteAttributeKey.tapRangesKey)
                as? Box<[NSRange]>)?.value
            return value ?? []
        }
        set {
            objc_setAssociatedObject(base,
                                     CuteAttributeKey.tapRangesKey,
                                     Box(newValue),
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /// UILabel highlight object if set.
    internal var labelHighlight: CuteHighlight? {
        get {
            return (objc_getAssociatedObject(base, CuteAttributeKey.highlightKey) as? Box<CuteHighlight?>)?.value
        }

        set {
            objc_setAssociatedObject(base,
                                     CuteAttributeKey.highlightKey,
                                     Box(newValue),
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
