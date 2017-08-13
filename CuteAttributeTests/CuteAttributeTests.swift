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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMatch() {
        let cute = text.cute
        let attributedString1 = cute
            .matchAllURL()
            .red
            .underline(.styleSingle, color: UIColor.yellow)
            .attributedString
        
        let attributedString2 = cute
            .match(string: "t")
            .blue
            .underline(.byWord, color: UIColor.orange)
            .attributedString
        
        XCTAssert(attributedString1.isEqual(to: attributedString2), "attributedString1 should equal to attributedString2.")
    }
    
    func testAttributed() {
        let cute = text.cute
        let attributedString1 = cute
            .matchAllURL()
            .red
            .underline(.styleSingle, color: UIColor.yellow)
        
        let ranges = attributedString1.matchAllURL().ranges
        var underlineStyle: Int?
        if let range = ranges.first {
            let attributes = attributedString1.attributedString.attributes(at: range.location, effectiveRange: nil)
            underlineStyle = attributes[NSUnderlineStyleAttributeName] as? Int
        }
        XCTAssert(underlineStyle == NSUnderlineStyle.styleSingle.rawValue, "the color should be equal to UIColor.red.")
    }
    
    func testColor() {
        let cute = text.cute
        let cuteAttributedString = cute.matchAll().red
        let color = cuteAttributedString.attributedString.attribute(NSForegroundColorAttributeName, at: 0, effectiveRange: nil) as? UIColor
        XCTAssert(color!.isEqual(UIColor.red), "color should be equal to red.")
    }
}
