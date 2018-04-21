//
//  CuteAttribute+append.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {
    /// Append
    /// `String`,
    /// `NSString`,
    /// `NSMutableAttributedString`
    /// or `NSAttributedString` to the base `NSMutableAttributedString`
    ///
    /// - Parameter string: It can be `String`, `NSString`, `NSMutableAttributedString` or `NSAttributedString`
    /// - Returns: self
    public func append(_ string: Any) -> CuteAttribute<Base> {
        let attributedString = CuteAttribute.convertToMutableAttributedString(string)
        base.append(attributedString)
        return self
    }
}
