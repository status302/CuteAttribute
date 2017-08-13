//
//  CuteAttribute+Match.swift
//  Cute
//
//  Created by vsccw on 2017/8/11.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {
    
    public func from(_ location: Int) -> CuteAttribute<Base> {
        assert(location <= base.string.length, "`from` must less than string's length.")
        from = location
        return self
    }
    
    public func to(_ location: Int) -> CuteAttribute<Base> {
        assert(location <= base.string.length, "`to` must less than string's length.")
        let range = NSRange(location: from, length: location - from)
        self.range = range
        return self
    }
    
    public func matchAll() -> CuteAttribute<Base> {
        self.ranges = [base.string.nsrange]
        return self
    }
    
    public func match(regex re: String) -> CuteAttribute<Base> {
        do {
            let regex = try RegexHelper(pattern: re)
            ranges = regex.matchs(input: base.string)
        }
        catch let err {
            fatalError("could not find string with re: \(err)")
        }
        return self
    }
    
    public func match(string str: String) -> CuteAttribute<Base> {
        var range = base.string.range(substring: str)
        assert(range.location != NSNotFound, "Substring must be in string.")
        ranges.removeAll()
        ranges.append(range)
        repeat {
            let location = range.location + range.length
            let length = base.string.length - location
            let allRange = NSMakeRange(location, length)
            range = base.string.range(substring: str, options: [], range: allRange)
            if range.length == 0 || range.location == NSNotFound {
                break
            }
            ranges.append(range)
        } while true
        return self
    }
    
    public func match(range ran: NSRange) -> CuteAttribute<Base> {
        assert(base.string.nsrange >> ran, "range should be in range of string.")
        self.range = ran
        return self
    }
    
    public func matchAllURL() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .link)
    }
    
    public func matchAllPhoneNumber() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .phoneNumber)
    }
    
    public func matchAllAddress() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .address)
    }
    
    public func matchAllDate() -> CuteAttribute<Base> {
        return matchAllAttribute(checkingType: .date)
    }
    
    internal func matchAllAttribute(checkingType: NSTextCheckingResult.CheckingType) -> CuteAttribute<Base> {
        do {
            let dataHelper = try DataDetectorHelper(types: checkingType.rawValue)
            ranges = dataHelper.matches(string: base.string)
        }
        catch let err {
            fatalError("Could not match string : \(err)")
        }
        return self
    }
    
    internal var from: Int {
        set {
            objc_setAssociatedObject(base, CuteAttributeKey.fromKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, CuteAttributeKey.fromKey) as? Int ?? 0
        }
    }
}
