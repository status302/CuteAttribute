//
//  CuteHighlight.swift
//  CuteAttribute
//
//  Created by vsccw on 2018/1/13.
//  Copyright © 2018年 https://vsccw.com. All rights reserved.
//

import Foundation

public struct CuteHighlight {
    /// default highlight text color is `UIColor.gray`
    public static let `default` = CuteHighlight(textColor: .gray)
    /// the text color for UILabel highlight status.
    public let textColor: UIColor
    /// the init function for `CuteHighlight`,
    /// if you want to use it, you must use `TapableLabel`.
    ///
    /// - Parameter textColor: apply to UILabel's text color.
    public init(textColor: UIColor) {
        self.textColor = textColor
    }
}
