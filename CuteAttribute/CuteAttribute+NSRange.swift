//
//  CuteAttribute+NSRange.swift
//  Cute
//
//  Created by vsccw on 2017/8/11.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {
    
    /// Set the range.
    ///
    /// - Parameter range: NSRange value.
    /// - Returns: self
    public func range(_ range: NSRange) -> CuteAttribute<Base> {
        assert(base.string.nsrange >> range, "range should be in range of string.")
        self.ranges = [range]
        return self
    }
    
    internal(set) var ranges: [NSRange] {
        get {
            let defaultRange = NSRange(location: 0, length: base.length)
            return objc_getAssociatedObject(base, CuteAttributeKey.rangesKey!) as? [NSRange] ?? [defaultRange]
        }
        set {
            objc_setAssociatedObject(base, CuteAttributeKey.rangesKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// Set the ranges.
    ///
    /// - Parameter ranges: [NSRange] value.
    /// - Returns: self
    public func ranges(_ ranges: [NSRange]) -> CuteAttribute<Base> {
        let isValid = ranges
            .flatMap { return base.string.nsrange >> $0 }
            .reduce(true) { return $1 && $0 }
        assert(isValid, "ranges must in string.")
        self.ranges = ranges
        return self
    }

}
