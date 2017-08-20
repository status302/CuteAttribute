//
//  String+Cute.swift
//  Cute
//
//  Created by vsccw on 2017/8/9.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public extension CuteAttribute where Base: NSMutableAttributedString {
    
    /// Set color for `NSForegroundColorAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter color: UIColor type without default value.
    /// - Returns: self
    public func color(_ color: UIColor) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSForegroundColorAttributeName, value: color, range: $0)
        }
        return self
    }
    
    /// Set baseline for `NSBaselineOffsetAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter baseline: CGFloat type without default value.
    /// - Returns: self
    public func baseline(_ baseline: CGFloat) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSBaselineOffsetAttributeName, value: baseline, range: $0)
        }
        return self
    }
    
    /// Set underline for `NSUnderlineStyleAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter underline: NSUnderlineStyle type without default value.
    /// - Returns: self
    public func underline(_ underline: NSUnderlineStyle) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSUnderlineStyleAttributeName, value: underline.rawValue, range: $0)
        }
        return self
    }
    
    /// Set underlineColor for `NSUnderlineColorAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter color: UIColor type without default value.
    /// - Returns: self
    public func underlineColor(_ color: UIColor) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSUnderlineColorAttributeName, value: color, range: $0)
        }
        return self
    }
    
    /// Set underlineStyle for `NSUnderlineStyleAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter underlineStyle: NSUnderlineStyle type without default value.
    /// - Parameter color: UIColor type without default value.
    /// - Returns: self
    public func underline(_ underlineStyle: NSUnderlineStyle, color: UIColor) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttributes([NSUnderlineStyleAttributeName: underlineStyle.rawValue, NSUnderlineColorAttributeName: color], range: $0)
        }
        return self
    }
    
    /// Set font for `NSFontAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter font: UIFont type without default value.
    /// - Returns: self
    public func font(_ font: UIFont) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSFontAttributeName, value: font, range: $0)
        }
        return self
    }
    
    /// Set fontName for `NSFontAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter name: String type without default value.
    /// - Returns: self
    public func fontName(_ name: String) -> CuteAttribute<Base> {
        ranges.forEach {
            var _range = $0
            let exitedFont = base.attribute(NSFontAttributeName, at: 0, effectiveRange: &_range) as? UIFont
            let size = exitedFont?.pointSize ?? 17.0
            let font = UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
            base.addAttribute(NSFontAttributeName, value: font, range: $0)
        }
        return self
    }
    
    /// Set strikeThrough for `NSStrikethroughStyleAttributeName`, this can be called after `range(_:)`, or not the range is default all the string.
    ///
    /// - Parameter strike: NSUnderlineStyle type without default value.
    /// - Returns: self
    public func strikeThrough(_ strike: NSUnderlineStyle) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSStrikethroughStyleAttributeName, value: strike.rawValue, range: $0)
        }
        return self
    }
    
    public func strikeThroughColor(_ color: UIColor) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSStrikethroughColorAttributeName, value: color, range: $0)
        }
        return self
    }
    
    public func link(_ link: String) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSLinkAttributeName, value: link, range: $0)
        }
        return self
    }
    
    public func ligature(_ ligature: Int) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSLigatureAttributeName, value: ligature, range: $0)
        }
        return self
    }
    
    public func kern(_ kern: CGFloat) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSKernAttributeName, value: kern, range: $0)
        }
        return self
    }
    
    public func strokeColor(_ color: UIColor) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSStrokeColorAttributeName, value: color, range: $0)
        }
        return self
    }
    
    public func strokeWidth(_ width: CGFloat) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSStrokeWidthAttributeName, value: width, range: $0)
        }
        return self
    }
    
    public func shadow(_ shadow: NSShadow) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSShadowAttributeName, value: shadow, range: $0)
        }
        return self
    }
    
    public func textEffect(_ effect: String) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSTextEffectAttributeName, value: effect, range: $0)
        }
        return self
    }
    
    public func obliqueness(_ value: CGFloat) -> CuteAttribute<Base>{
        ranges.forEach {
            base.addAttribute(NSObliquenessAttributeName, value: value, range: $0)
        }
        return self
    }
    
    public func expansion(_ value: CGFloat) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSExpansionAttributeName, value: value, range: $0)
        }
        return self
    }
    
    public func textAttachment(_ value: NSTextAttachment) -> CuteAttribute<Base> {
        ranges.forEach {
            base.addAttribute(NSAttachmentAttributeName, value: value, range: $0)
        }
        return self
    }
}
