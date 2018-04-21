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

    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        guard bounds.contains(location) else { return }
        guard let tapRanges = cute.attributedText?.tapRanges else { return }
        guard let tappedRange = didTapRangeOfLink(inRanges: tapRanges, tapLocation: location) else { return }
        tappingRange = tappedRange
        let attriubes = attributedText?.attributes(at: tappedRange.location,
                                                   longestEffectiveRange: nil,
                                                   in: tappedRange)
        let attributedColor = attriubes?[NSAttributedStringKey.foregroundColor] as? UIColor
        highlight = CuteHighlight(textColor: attributedColor ?? textColor)
        let highlightColor = cute.attributedText?.labelHighlight?.textColor ?? CuteHighlight.default.textColor
        cute.attributedText = cute.attributedText?
            .match(range: tappedRange)
            .color(highlightColor)
    }

    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
    }

    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let tappingRange = self.tappingRange {
            delegate?.tapableLabel(self,
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
    }

    internal func commitInit() {
        isUserInteractionEnabled = true
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
        let textRange = NSRange(location: 0, length: attributedString.length)
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
