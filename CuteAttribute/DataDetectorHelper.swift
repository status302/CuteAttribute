//
//  DataDetectorHelper.swift
//  Cute
//
//  Created by vsccw on 2017/8/12.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

struct DataDetectorHelper {
    let dataDetactor: NSDataDetector
    
    init(types: NSTextCheckingTypes) throws {
        try dataDetactor = NSDataDetector(types: types)
    }
    
    func matches(string: String) -> [NSRange] {
        let range = NSRange(location: 0, length: string.length)
        return dataDetactor.matches(in: string, options: [], range: range)
            .filter({
                $0.range.length > 0
            })
            .flatMap({
                $0.range
            })
        
    }
}
