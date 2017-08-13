//
//  CuteAttribute+Convert.swift
//  Cute
//
//  Created by vsccw on 2017/8/10.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute {
    public static func convertToMutableAttributedString(_ str: Any) -> NSMutableAttributedString {
        let isValid = (str is String)
            || (str is NSString)
            || (str is NSAttributedString)
            || (str is NSMutableAttributedString)
        
        assert(isValid, "only support `String`, `NSString`, `NSAttributedString`, `NSMutableAttributedString`.")
        
        if str is NSMutableAttributedString {
            return str as! NSMutableAttributedString
        }
        else if str is NSAttributedString {
            return NSMutableAttributedString(attributedString: str as! NSAttributedString)
        }
        else if str is NSString {
            return NSMutableAttributedString(string: (str as! NSString).string)
        }
        else {
            return NSMutableAttributedString(string: str as! String)
        }
    }
}
