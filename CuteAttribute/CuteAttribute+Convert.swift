//
//  CuteAttribute+Convert.swift
//  Cute
//
//  Created by vsccw on 2017/8/10.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import Foundation

public extension CuteAttribute {
    /// `String`, `NSString`, `NSMutableAttributedString` or `NSAttributedString` to `NSMutableAttributedString`
    ///
    /// - Parameter str: Any value.
    /// - Returns: NSMutableAttributedString
    static func convertToMutableAttributedString(_ str: Any) -> NSMutableAttributedString {
        let isValid = (str is String)
            || (str is NSString)
            || (str is NSAttributedString)
            || (str is NSMutableAttributedString)

        assert(isValid, "only support `String`, `NSString`, `NSAttributedString`, `NSMutableAttributedString`.")

        if let attribuedString = str as? NSMutableAttributedString {
            return attribuedString
        } else if let attribuedString = str as? NSAttributedString {
            return NSMutableAttributedString(attributedString: attribuedString)
        } else if let string = str as? NSString {
            return NSMutableAttributedString(string: string as String)
        } else if let string = str as? String {
            return NSMutableAttributedString(string: string)
        } else {
            return NSMutableAttributedString(string: "")
        }
    }
}
