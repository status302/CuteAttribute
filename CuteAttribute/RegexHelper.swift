//
//  RegexHelper.swift
//  Cute
//
//  Created by vsccw on 2017/8/12.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

public struct RegexHelper {
    
    let regex: NSRegularExpression
    
    public init(pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .allowCommentsAndWhitespace)
    }
    
    public func matchs(input: String) -> [NSRange] {
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        
        return matches.flatMap({
            $0.range
        }).filter({
            $0.length > 0
        })
    }
}
