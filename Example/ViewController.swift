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
    
    let text = "我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线我是一条线"

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var testLabel: TapableLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.cute.attributedText = text.cute
            .from(0)
            .to(10)
            .yellow
            .matchAllPhoneNumber()
            .rgbColor(0x880011)
            .underline(.styleSingle)
            .underlineColor(.gray)
            .matchAllURL()
            .red
            .singleUnderline
            .underlineColor(.blue)
            .matchAllDate()
            .green
            .doubleUnderline
            .underlineColor(.orange)
            .matchAll()
            .font(UIFont.systemFont(ofSize: 30))
        
        let cuteAttr = "请点击该链接：https://vsccw.com，😆😆😆😆😆😆"
            .cute
            .matchAllURL()
            .color(.red)
            .underline(.styleSingle)
            .tap(.link)
            .highlight(CuteHighlight(textColor: UIColor.black, backgroundColor: UIColor.gray))
        
        testLabel.cute.attributedText = cuteAttr
        
        testLabel.delegate = self
    }
    
    private func showAlertController(_ message: String?) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "我知道啦", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: TapableLabelDelegate {
    
    func tapableLabel(_ label: TapableLabel, didTap range: NSRange, text: String?) {
        showAlertController(text)
    }
}

