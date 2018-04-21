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
    let text = """
              hello world,
              17600636630
              2018-04-21 18:03:48
              https://blog.vsccw.com
              """

    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var testLabel: TapableLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let dateFont = UIFont(name: "Menlo", size: 24) ?? UIFont.systemFont(ofSize: 24)
        textView.cute.attributedText = text.cute
            .from(0)
            .to(10)
            .blue
            .font(UIFont.systemFont(ofSize: 40))
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
            .font(dateFont)
        let cuteAttr = "请点击该链接：https://vsccw.com，17600636630😆😆😆😆😆😆"
            .cute
            .matchAllURL()
            .color(.red)
            .underline(.styleSingle)
            .tap(.link)
            .highlight(.default)
            .tap(.phoneNumber)
            .highlight(.default)

        testLabel.cute.attributedText = cuteAttr

        testLabel.delegate = self
    }

    private func showAlertController(_ message: String?) {
        let alertController = UIAlertController(title: "你点击了", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "我知道啦", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: TapableLabelDelegate {

    func tapableLabel(_ label: TapableLabel, didTap range: NSRange, text: String?) {
        showAlertController(text)
    }
}
