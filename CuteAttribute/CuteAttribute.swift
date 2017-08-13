//
//  CuteAttribute.swift
//  Cute
//
//  Created by vsccw on 2017/8/9.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import Foundation

public protocol CuteAttributeable {
    associatedtype Attributeable
    var cute: Attributeable { get }
}

public final class CuteAttribute<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public extension CuteAttributeable {
    public var cute: CuteAttribute<Self> {
        get { return CuteAttribute(self) }
    }
}

extension NSMutableAttributedString: CuteAttributeable { }
