//
//  CuteAttribute+NSRange.swift
//  Cute
//
//  Created by vsccw on 2017/8/11.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {
    internal(set) var range: NSRange {
        get {
            let defaultRange = NSRange(location: 0, length: base.length)
            return objc_getAssociatedObject(base, CuteAttributeKey.rangeKey) as? NSRange ?? defaultRange
        }
        set {
            objc_setAssociatedObject(base, CuteAttributeKey.rangeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func range(_ range: NSRange) -> CuteAttribute<Base> {
        assert(base.string.nsrange >> range, "range must in string.")
        self.range = range
        self.ranges = [range]
        return self
    }
    
    internal(set) var ranges: [NSRange] {
        get {
            let defaultRange = NSRange(location: 0, length: base.length)
            return objc_getAssociatedObject(base, CuteAttributeKey.rangesKey) as? [NSRange] ?? [defaultRange]
        }
        set {
            objc_setAssociatedObject(base, CuteAttributeKey.rangesKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func ranges(_ ranges: [NSRange]) -> CuteAttribute<Base> {
        let isValid = ranges
            .flatMap { return base.string.nsrange >> $0 }
            .reduce(true) { return $0.1 && $0.0 }
        assert(isValid, "ranges must in string.")
        self.ranges = ranges
        return self
    }

}
