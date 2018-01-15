//
//  UIView+Cute.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/11/12.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

extension UIView {
    internal var _cuteAttribute: CuteAttribute<NSMutableAttributedString>? {
        set {
            objc_setAssociatedObject(self, CuteAttributeKey.viewCuteKey, Box(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return (objc_getAssociatedObject(self, CuteAttributeKey.viewCuteKey) as? Box<CuteAttribute<NSMutableAttributedString>?>)?.value
        }
    }
}
