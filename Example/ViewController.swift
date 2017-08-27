//
//  ViewController.swift
//  Example
//
//  Created by vsccw on 2017/8/13.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit
import CuteAttribute

class ViewController: UIViewController {
    
    let text = "iOS 11 sets a new standard for the world’s most advanced mobile operating system. Your apps can now become more intelligent using the power of machine learning with Core ML. You can create incredible augmented reality experiences with ARKit. And you can deliver a more unified and immersive user experience with new multitasking features, including drag and drop for iPad, the new Files app, new camera APIs, new SiriKit domains, Apple Music integration, and more. 18829214288 https://vsccw.com Apple 1 Infinite Loop Cupertino, CA 95014 408-996–1010"

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.cute.attributedText = text.cute
            .from(0)
            .to(10)
            .yellow
            .matchAllPhoneNumber()
            .rgbColor(0x880011)
            .underline(NSUnderlineStyle.styleSingle)
            .underlineColor(UIColor.gray)
            .matchAllURL()
            .red
            .singleUnderline
            .underlineColor(UIColor.blue)
            .match(string: "Apple")
            .green
            .doubleUnderline
            .underlineColor(UIColor.orange)
    }
}

