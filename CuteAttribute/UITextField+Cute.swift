//
//  UITextField+Cute.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/8/27.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

extension UITextField: CuteAttributeable { }

public extension CuteAttribute where Base: UITextField {
    public var attributedText: CuteAttribute<NSMutableAttributedString>? {
        set {
            base.attributedText = newValue?.attributedString
            base._cuteAttribute = newValue
        }
        get {
            return base._cuteAttribute
        }
    }
}
