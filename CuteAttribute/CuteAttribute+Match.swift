//
//  CuteAttribute+Match.swift
//  Cute
//
//  Created by vsccw on 2017/8/11.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {

    /// As set `NSRange`'s location, it must less than string's length.
    ///
    /// - Parameter location: the location you choose to set.
    /// - Returns: self
    public func from(_ location: Int) -> CuteAttribute<Base> {
        assert(location <= base.string.length, "`from` must less than string's length.")
        from = location
        return self
    }

    /// As set `NSRange`'s length,
    /// it must less than string's length,
    /// and it must more than from. It must be work with `from(_:)`
    ///
    /// - Parameter location: the locatoin you choose to set.
    /// - Returns: self
    public func to(_ location: Int) -> CuteAttribute<Base> {
        assert(location <= base.string.length, "`to` must less than string's length.")
        let range = NSRange(location: from, length: location - from)
        return self.range(range)
    }

    /// Match all the `NSMutableAttributedString`.
    ///
    /// - Returns: self
    public func matchAll() -> CuteAttribute<Base> {
        self.ranges = [base.string.nsrange]
        return self
    }

    /// Match `subString` with regex pattern.
    ///
    /// - Parameter re: the regex pattern you set.
    /// - Returns: self
    public func match(using regex: String) -> CuteAttribute<Base> {
        do {
            let regex = try RegexHelper(pattern: regex)
            ranges = regex.matchs(input: base.string)
        } catch let err {
            fatalError("could not find string with re: \(err)")
        }
        return self
    }

    /// Match all the subString.
    ///
    /// - Parameter str: subString
    /// - Returns: self
    public func match(string: String) -> CuteAttribute<Base> {
        var range = base.string.range(substring: string)
        assert(range.location != NSNotFound, "Substring must be in string.")
        ranges.removeAll()
        ranges.append(range)
        repeat {
            let location = range.location + range.length
            let length = base.string.length - location
            let allRange = NSRange(location: location, length: length)
            range = base.string.range(substring: string, options: [], range: allRange)
            if range.length == 0 || range.location == NSNotFound {
                break
            }
            ranges.append(range)
        } while true
        return self
    }

    /// Match the special range
    ///
    /// - Parameter ran: the NSRange you set.
    /// - Returns: self
    public func match(range ran: NSRange) -> CuteAttribute<Base> {
        assert(base.string.nsrange >> ran, "range should be in range of string.")
        return self.range(ran)
    }

    /// Match all the url.
    ///
    /// - Returns: self
    public func matchAllURL() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .link)
    }

    /// Match all the phone number.
    ///
    /// - Returns: self
    public func matchAllPhoneNumber() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .phoneNumber)
    }

    /// Match all the address.
    ///
    /// - Returns: self
    public func matchAllAddress() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .address)
    }

    /// Match all the date.
    ///
    /// - Returns: self
    public func matchAllDate() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .date)
    }

    internal func matchAllAttribute(checkingType: NSTextCheckingResult.CheckingType) -> CuteAttribute<Base> {
        do {
            let dataHelper = try DataDetectorHelper(types: checkingType.rawValue)
            ranges = dataHelper.matches(string: base.string)
        } catch let err {
            fatalError("Could not match string : \(err)")
        }
        return self
    }

    internal var from: Int {
        set {
            objc_setAssociatedObject(base, CuteAttributeKey.fromKey, Box(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return (objc_getAssociatedObject(base, CuteAttributeKey.fromKey) as? Box<Int>)?.value ?? 0
        }
    }
}
