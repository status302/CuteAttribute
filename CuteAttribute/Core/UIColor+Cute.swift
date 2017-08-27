//
//  UIColor+Cute.swift
//  Cute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public convenience init(rgb: Int) {
        self.init(red: CGFloat((rgb >> 16) & 0xff) / 255.0,
                  green: CGFloat((rgb >> 8) & 0xff) / 255.0,
                  blue: CGFloat(rgb & 0xff) / 255.0,
                  alpha: 1.0)
    }
    
    public convenience init(argb: Int) {
        self.init(red: CGFloat((argb >> 16) & 0xff) / 255.0,
                  green: CGFloat((argb >> 8) & 0xff) / 255.0,
                  blue: CGFloat(argb & 0xff) / 255.0,
                  alpha: CGFloat((argb >> 24) & 0xff) / 255.0)
    }
}
