//
//  TapableLabel.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/11/12.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

/// The delegate to handle tap of label.
public protocol TapableLabelDelegate: class {
    func tapableLabel(_ label: TapableLabel, didTap range: NSRange, text: String?)
}

/// a subclass UILabel used to handle tap with CuteAttribute's `tap(_ type: CuteAttributeTapType)`
@IBDesignable
open class TapableLabel: UILabel {
    
    public weak var delegate: TapableLabelDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
        print(3)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
        print(2)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        commitInit()
        print(1)
    }
    
    internal func commitInit() {
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTapGesture(_ tap: UITapGestureRecognizer) {
        let location = tap.location(in: self)
        guard bounds.contains(location) else { return }
        guard let tapRanges = cute.attributedText?.tapRanges else { return }
        guard let tappedRange = didTapRangeOfLink(inRanges: tapRanges, tapLocation: location) else { return }
        delegate?.tapableLabel(self, didTap: tappedRange, text: text?.nsstring.substring(with: tappedRange))
    }
}


extension TapableLabel {
    
    internal func didTapRangeOfLink(inRanges ranges: [NSRange]?, tapLocation: CGPoint) -> NSRange? {
        guard let ranges = ranges, let text = self.text else { return nil }
        
        let attributedString = NSMutableAttributedString(string: text)
        let textRange = NSMakeRange(0, attributedString.length)
        attributedString.addAttributes([.font: self.font], range: textRange)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        attributedString.addAttributes([.paragraphStyle: paragraphStyle], range: textRange)
        
        let size = self.bounds.size
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: attributedString)
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = self.lineBreakMode
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.size = CGSize(width: size.width, height: (size.height + CGFloat(self.numberOfLines)))
        
        let characterIndex = layoutManager.glyphIndex(for: tapLocation, in: textContainer,
                                                      fractionOfDistanceThroughGlyph: nil)
        let glyphRect = layoutManager.boundingRect(forGlyphRange: NSRange(location: characterIndex, length: 1),
                                                   in: textContainer)
        
        return ranges.filter { glyphRect.contains(tapLocation) && NSLocationInRange(characterIndex, $0) }.first
    }
}
