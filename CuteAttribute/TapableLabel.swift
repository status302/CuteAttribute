//
//  TapableLabel.swift
//  CuteAttribute
//
//  Created by vsccw on 2017/11/12.
//  Copyright © 2017年 https://vsccw.com. All rights reserved.
//

import UIKit

/// The delegate to handle tap of label.
@objc
public protocol TapableLabelDelegate: AnyObject {
    @objc
    optional func tapableLabel(_ label: TapableLabel, didTap range: NSRange, text: String?)
}

/// a subclass UILabel used to handle tap with CuteAttribute's `tap(_ type: CuteAttributeTapType)`
@IBDesignable
open class TapableLabel: UILabel {

    public weak var delegate: TapableLabelDelegate?

    private var tappingRange: NSRange?
    private var highlight: CuteHighlight?
    private var previousAttributes: Box<CuteAttribute<NSMutableAttributedString>?>?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commitInit()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        commitInit()
    }

    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let superHitTest = super.hitTest(point, with: event)
        guard bounds.contains(point) else { return superHitTest }
        guard let tapRanges = cute.attributedText?.tapRanges else { return superHitTest }
        guard didTapRangeOfLink(inRanges: tapRanges, tapLocation: point) != nil else { return superHitTest }
        return self
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            super.touchesBegan(touches, with: event)
            return
        }
        let location = touch.location(in: self)
        guard bounds.contains(location) else {
            super.touchesBegan(touches, with: event)
            return
        }
        guard let tapRanges = cute.attributedText?.tapRanges else {
            super.touchesBegan(touches, with: event)
            return
        }
        guard let tappedRange = didTapRangeOfLink(inRanges: tapRanges, tapLocation: location) else {
            super.touchesBegan(touches, with: event)
            return
        }
        tappingRange = tappedRange
        let attriubes = attributedText?.attributes(at: tappedRange.location,
                                                   longestEffectiveRange: nil,
                                                   in: tappedRange)
        let attributedColor = attriubes?[.foregroundColor] as? UIColor
        highlight = CuteHighlight(textColor: attributedColor ?? textColor)
        let highlightColor = cute.attributedText?.labelHighlight?.textColor ?? CuteHighlight.default.textColor
        cute.attributedText = cute.attributedText?
            .match(range: tappedRange)
            .color(highlightColor)
    }

    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let tappingRange = self.tappingRange {
            delegate?.tapableLabel?(self,
                                   didTap: tappingRange,
                                   text: text?.nsstring.substring(with: tappingRange))
            let textColor = highlight?.textColor ?? .clear
            cute.attributedText = cute.attributedText?
                .match(range: tappingRange)
                .color(textColor)
        }

        tappingRange = nil
        highlight = nil
        previousAttributes = nil
    }

    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        if let tappingRange = self.tappingRange {
            let textColor = highlight?.textColor ?? .clear
            cute.attributedText = cute.attributedText?
                .match(range: tappingRange)
                .color(textColor)
        }
        
        tappingRange = nil
        highlight = nil
        previousAttributes = nil
    }

    internal func commitInit() {
        isUserInteractionEnabled = true
    }
}

extension TapableLabel {

    internal func didTapRangeOfLink(inRanges ranges: [NSRange]?, tapLocation: CGPoint) -> NSRange? {
        guard let ranges = ranges, let text = self.text else { return nil }

        let attributedString = NSMutableAttributedString(string: text)
        let textRange = NSRange(location: 0, length: attributedString.length)
        if let font = self.font {
            attributedString.addAttributes([.font: font], range: textRange)
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        
        if !text.isEmpty {
            let attrs = attributedText?.attributes(at: 0, effectiveRange: nil)
            if let paragraph = attrs?[NSAttributedString.Key.paragraphStyle] as? NSMutableParagraphStyle {
                paragraphStyle.lineSpacing = paragraph.lineSpacing
            }
        }
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

        let boundingBox = layoutManager.usedRect(for: textContainer)
        let originY = (size.height - boundingBox.height) * 0.5 - boundingBox.minY
        let location = CGPoint(x: tapLocation.x, y: tapLocation.y - originY)
        guard location.x >= boundingBox.minX,
            location.x <= boundingBox.minX + boundingBox.width,
            location.y >= boundingBox.minY,
            location.y <= boundingBox.minY + boundingBox.height
            else { return nil }
        let characterIndex = layoutManager.glyphIndex(for: location, in: textContainer,
                                                     fractionOfDistanceThroughGlyph: nil)
        return ranges.filter { NSLocationInRange(characterIndex, $0) }.first
    }
}
