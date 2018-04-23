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
    public var singleUnderline: CuteAttribute<Base> {
        return underline(.styleSingle)
    }

    /// `NSUnderlineStyle.styleNone` underline style
    public var noneUnderline: CuteAttribute<Base> {
        return underline(.styleNone)
    }

    /// `NSUnderlineStyle.styleThick` underline style
    public var thickUnderline: CuteAttribute<Base> {
        return underline(.styleThick)
    }

    /// `NSUnderlineStyle.styleDouble` underline style
    public var doubleUnderline: CuteAttribute<Base> {
        return underline(.styleDouble)
    }

    /// `NSUnderlineStyle.patternSolid` underline style
    public var patternSolidUnderline: CuteAttribute<Base> {
        return underline(.patternSolid)
    }

    /// `NSUnderlineStyle.patternDot` underline style
    public var patternDotUnderline: CuteAttribute<Base> {
        return underline(.patternDot)
    }

    /// `NSUnderlineStyle.patternDash` underline style
    public var patternDashUnderline: CuteAttribute<Base> {
        return underline(.patternDash)
    }

    /// `NSUnderlineStyle.patternDashDot` underline style
    public var patternDashDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDot)
    }

    /// `NSUnderlineStyle.patternDashDotDot` underline style
    public var patternDashDotDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDotDot)
    }

    /// `NSUnderlineStyle.byWord` underline style
    public var byWordUnderline: CuteAttribute<Base> {
        return underline(.byWord)
    }
}
