//
//  CuteHighlight.swift
//  CuteAttribute
//
//  Created by vsccw on 2018/1/13.
//  Copyright © 2018年 https://vsccw.com. All rights reserved.
//

import UIKit

public struct CuteHighlight {
    public static let `default` = CuteHighlight(textColor: .gray)
    public let textColor: UIColor
    public init(textColor: UIColor) {
        self.textColor = textColor
    }
}
