//
//  UIFont.swift
//  Wordle
//
//  Created by mpc on 5/4/22.
//

import UIKit

extension UIFont {
    func withTraits(traits:UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }

    func uiOptimized() -> UIFont {
        return withTraits(traits: .traitUIOptimized)
    }

    func vertical() -> UIFont {
        return withTraits(traits: .traitVertical)
    }

    func condensed() -> UIFont {
        return withTraits(traits: .traitCondensed)
    }
}
