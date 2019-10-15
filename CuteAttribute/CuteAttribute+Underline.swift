//
//  CuteAttribute+Underline.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import Foundation

public extension CuteAttribute where Base: NSMutableAttributedString {
    /// `NSUnderlineStyle.styleSingle` underline style
    var singleUnderline: CuteAttribute<Base> {
        return underline(.single)
    }

    /// `NSUnderlineStyle.styleNone` underline style
    var noneUnderline: CuteAttribute<Base> {
        return underline([])
    }

    /// `NSUnderlineStyle.styleThick` underline style
    var thickUnderline: CuteAttribute<Base> {
        return underline(.thick)
    }

    /// `NSUnderlineStyle.styleDouble` underline style
    var doubleUnderline: CuteAttribute<Base> {
        return underline(.double)
    }

    /// `NSUnderlineStyle.patternDot` underline style
    var patternDotUnderline: CuteAttribute<Base> {
        return underline(.patternDot)
    }

    /// `NSUnderlineStyle.patternDash` underline style
    var patternDashUnderline: CuteAttribute<Base> {
        return underline(.patternDash)
    }

    /// `NSUnderlineStyle.patternDashDot` underline style
    var patternDashDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDot)
    }

    /// `NSUnderlineStyle.patternDashDotDot` underline style
    var patternDashDotDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDotDot)
    }

    /// `NSUnderlineStyle.byWord` underline style
    var byWordUnderline: CuteAttribute<Base> {
        return underline(.byWord)
    }
}
