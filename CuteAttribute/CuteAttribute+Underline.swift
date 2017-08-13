//
//  CuteAttribute+Underline.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

extension CuteAttribute where Base: NSMutableAttributedString {
    var singleUnderline: CuteAttribute<Base> {
        return underline(.styleSingle)
    }
    
    var noneUnderline: CuteAttribute<Base> {
        return underline(.styleNone)
    }
    
    var thickUnderline: CuteAttribute<Base> {
        return underline(.styleThick)
    }
    
    var doubleUnderline: CuteAttribute<Base> {
        return underline(.styleDouble)
    }
    
    var patternSolidUnderline: CuteAttribute<Base> {
        return underline(.patternSolid)
    }
    
    var patternDotUnderline: CuteAttribute<Base> {
        return underline(.patternDot)
    }
    
    var patternDashUnderline: CuteAttribute<Base> {
        return underline(.patternDash)
    }
    
    var patternDashDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDot)
    }
    
    var patternDashDotDotUnderline: CuteAttribute<Base> {
        return underline(.patternDashDotDot)
    }
    
    var byWordUnderline: CuteAttribute<Base> {
        return underline(.byWord)
    }
}
