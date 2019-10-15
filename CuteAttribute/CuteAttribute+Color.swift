//
//  CuteAttribute+Color.swift
//  Cute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit.UIColor

public extension CuteAttribute where Base: NSMutableAttributedString {

    /// Set `NSForegroundColorAttributeName` to red.
    var red: CuteAttribute<Base> {
        return color(UIColor.red)
    }

    /// Set `NSForegroundColorAttributeName` to blue.
    var blue: CuteAttribute<Base> {
        return color(UIColor.blue)
    }

    /// Set `NSForegroundColorAttributeName` to black.
    var black: CuteAttribute<Base> {
        return color(UIColor.black)
    }

    /// Set `NSForegroundColorAttributeName` to green.
    var green: CuteAttribute<Base> {
        return color(UIColor.green)
    }

    /// Set `NSForegroundColorAttributeName` to cyan.
    var cyan: CuteAttribute<Base> {
        return color(UIColor.cyan)
    }

    /// Set `NSForegroundColorAttributeName` to yellow.
    var yellow: CuteAttribute<Base> {
        return color(UIColor.yellow)
    }

    /// Set `NSForegroundColorAttributeName` to magenta.
    var magenta: CuteAttribute<Base> {
        return color(UIColor.magenta)
    }

    /// Set `NSForegroundColorAttributeName` to gray.
    var gray: CuteAttribute<Base> {
        return color(UIColor.gray)
    }

    /// Set `NSForegroundColorAttributeName` to white.
    var white: CuteAttribute<Base> {
        return color(UIColor.white)
    }

    /// Set `NSForegroundColorAttributeName` to lightGray.
    var lightGray: CuteAttribute<Base> {
        return color(UIColor.lightGray)
    }

    /// Set `NSForegroundColorAttributeName` to darkGray.
    var darkGray: CuteAttribute<Base> {
        return color(UIColor.darkGray)
    }

    /// Set `NSForegroundColorAttributeName` to purple.
    var purple: CuteAttribute<Base> {
        return color(UIColor.purple)
    }

    /// Set `NSForegroundColorAttributeName` to orange.
    var orange: CuteAttribute<Base> {
        return color(UIColor.orange)
    }

    /// Set `NSForegroundColorAttributeName` to brown.
    var brown: CuteAttribute<Base> {
        return color(UIColor.brown)
    }

    /// Set `NSForegroundColorAttributeName` to clear.
    var clear: CuteAttribute<Base> {
        return color(UIColor.clear)
    }

    /// Set `NSForegroundColorAttributeName` to rgb color.
    ///
    /// - Parameter hex: Int value, example: 0xffbb00
    /// - Returns: self
    func rgbColor(_ hex: Int) -> CuteAttribute<Base> {
        let rgb = UIColor(rgb: hex)
        return color(rgb)
    }

    /// Set `NSForegroundColorAttributeName` to argb color.
    ///
    /// - Parameter hex: Int value, example: 0xbbffddaa
    /// - Returns: self
    func argbColor(_ hex: Int) -> CuteAttribute<Base> {
        let argb = UIColor(argb: hex)
        return color(argb)
    }
}
