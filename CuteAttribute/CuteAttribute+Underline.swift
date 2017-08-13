//
//  CuteAttribute+Underline.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {
    public var singleUnderline: CuteAttribute<Base> {
        return underline(.styleSingle)
    }
    
    public var noneUnderline: CuteAttribute<Base> {
        return underline(.styleNone)
    }
    
    public var thickUnderline: CuteAttribute<Base> {
        return underline(.styleThick)
    }
    
    public var doubleUnderline: CuteAttribute<Base> {
        return underline(.styleDouble)
    }
    
    public var patternSolidUnderline: CuteAttribute<Base> {
        return underline(.patternSolid)
    }
    
    public var patternDotUnderline: CuteAttribute<Base> {
        return underline(.patternDot)
    }
    
    public var patternDashUnderline: CuteAttribute<Base> {
        return underline(.patternDash)
    }
    
    public var patternDashDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDot)
    }
    
    public var patternDashDotDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDotDot)
    }
    
    public var byWordUnderline: CuteAttribute<Base> {
        return underline(.byWord)
    }
}
