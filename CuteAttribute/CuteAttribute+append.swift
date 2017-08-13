//
//  CuteAttribute+append.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

extension CuteAttribute where Base: NSMutableAttributedString {
    public func append(_ string: Any) -> CuteAttribute<Base> {
        let attributedString = CuteAttribute.convertToMutableAttributedString(string)
        base.append(attributedString)
        return self
    }
}
