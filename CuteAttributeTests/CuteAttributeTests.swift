//
//  CuteAttributeTests.swift
//  CuteAttributeTests
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import XCTest
@testable import CuteAttribute

class CuteAttributeTests: XCTestCase {
    var text: String!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        text = "hello CuteAttribute, made by vsccw, Copyright © 2017年 https://vsccw.com. "
    }

    func testMatch() {
        let cute = text.cute
        let attributedString1 = cute
            .matchAllURL()
            .red
            .underline(.single, color: UIColor.yellow)
            .attributedString
        let attributedString2 = cute
            .match(string: "t")
            .blue
            .underline(.byWord, color: UIColor.orange)
            .attributedString
        let msg = "attributedString1 should equal to attributedString2."
        XCTAssert(attributedString1.isEqual(to: attributedString2), msg)
    }

    func testAttributed() {
        let cute = text.cute
        let attributedString1 = cute
            .matchAllURL()
            .red
            .underline(.single, color: UIColor.yellow)
        let ranges = attributedString1.matchAllURL().ranges
        var underlineStyle: Int?
        if let range = ranges.first {
            let attributes = attributedString1.attributedString.attributes(at: range.location, effectiveRange: nil)
            underlineStyle = attributes[NSAttributedString.Key.underlineStyle] as? Int
        }
        XCTAssert(underlineStyle == NSUnderlineStyle.single.rawValue, "the color should be equal to UIColor.red.")
    }
    func testColor() {
        let cute = text.cute
        let cuteAttributedString = cute.matchAll().red
        let color = cuteAttributedString.attributedString
            .attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor
        XCTAssert(color!.isEqual(UIColor.red), "color should be equal to red.")
    }
}
