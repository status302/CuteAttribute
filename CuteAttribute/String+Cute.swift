//
//  NSString+Cute.swift
//  Cute
//
//  Created by vsccw on 2017/8/10.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

infix operator >>
public func >> (left: NSRange, right: NSRange) -> Bool {
    return right.location >= left.location
        && (left.location + left.length) >= (right.location + right.length)
}

public extension NSAttributedString {

    public var cute: CuteAttribute<NSMutableAttributedString> {
        return CuteAttribute(NSMutableAttributedString(attributedString: self))
    }
}

public extension NSString {

    public var range: NSRange {
        return NSRange(location: 0, length: length)
    }

    public var string: String {
        return self as String
    }

    public var cute: CuteAttribute<NSMutableAttributedString> {
        return CuteAttribute(NSMutableAttributedString(string: string))
    }
}

public extension String {

    public var nsstring: NSString {
        return self as NSString
    }

    public var cute: CuteAttribute<NSMutableAttributedString> {
        return CuteAttribute(NSMutableAttributedString(string: self))
    }

    public var length: Int {
        return nsstring.length
    }

    public var nsrange: NSRange {
        return NSRange(location: 0, length: nsstring.length)
    }

    public func range(substring: String) -> NSRange {
        return nsstring.range(of: substring)
    }

    public func range(substring: String, options: NSString.CompareOptions, range: NSRange) -> NSRange {
        return nsstring.range(of: substring, options: options, range: range)
    }
}
