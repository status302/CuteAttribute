//
//  CuteAttributeKeys.swift
//  Cute
//
//  Created by vsccw on 2017/8/9.
//  Copyright © 2017年 YOLO. All rights reserved.
//

import UIKit

internal struct CuteAttributeKey {
    static let rangeKey = UnsafeRawPointer(bitPattern: "rangeKey".hashValue)
    static let rangesKey = UnsafeRawPointer(bitPattern: "rangesKey".hashValue)
    
    static let fromKey = UnsafeRawPointer(bitPattern: "fromKey".hashValue)
}
