//
//  CuteAttribute+Color.swift
//  Cute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 YOLO. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {
    
    public var red: CuteAttribute<Base> {
        return color(UIColor.red)
    }
    
    public var blue: CuteAttribute<Base> {
        return color(UIColor.blue)
    }
    
    public var black: CuteAttribute<Base> {
        return color(UIColor.black)
    }
    
    public var green: CuteAttribute<Base> {
        return color(UIColor.green)
    }
    
    public var cyan: CuteAttribute<Base> {
        return color(UIColor.cyan)
    }
    
    public var yellow: CuteAttribute<Base> {
        return color(UIColor.yellow)
    }
    
    public var magenta: CuteAttribute<Base> {
        return color(UIColor.magenta)
    }
    
    public var gray: CuteAttribute<Base> {
        return color(UIColor.gray)
    }
    
    public var white: CuteAttribute<Base> {
        return color(UIColor.white)
    }
    
    public var lightGray: CuteAttribute<Base> {
        return color(UIColor.lightGray)
    }
    
    public var darkGray: CuteAttribute<Base> {
        return color(UIColor.darkGray)
    }
    
    public var purple: CuteAttribute<Base> {
        return color(UIColor.purple)
    }
    
    public var orange: CuteAttribute<Base> {
        return color(UIColor.orange)
    }
    
    public var brown: CuteAttribute<Base> {
        return color(UIColor.brown)
    }
    
    public var clear: CuteAttribute<Base> {
        return color(UIColor.clear)
    }
    
    public func rgbColor(_ hex: Int) -> CuteAttribute<Base> {
        let rgb = UIColor(rgb: hex)
        return color(rgb)
    }
    
    public func argbColor(_ hex: Int) -> CuteAttribute<Base> {
        let argb = UIColor(argb: hex)
        return color(argb)
    }
}
