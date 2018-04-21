//
//  CuteAttribute.swift
//  Cute
//
//  Created by vsccw on 2017/8/9.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import Foundation

/// A protocol type for `CuteAttribute`
public protocol CuteAttributeable {

    associatedtype Attributeable
    var cute: Attributeable { get }
}

public final class CuteAttribute<Base>: NSObject {

    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public extension CuteAttributeable {

    public var cute: CuteAttribute<Self> {
        return CuteAttribute(self)
    }
}

extension NSMutableAttributedString: CuteAttributeable { }

public extension CuteAttribute where Base: NSMutableAttributedString {

    public var attributedString: NSMutableAttributedString {
        return base
    }

    public var copy: CuteAttribute<NSMutableAttributedString>? {
        return type(of: self).init(base) as? CuteAttribute<NSMutableAttributedString>
    }
}
