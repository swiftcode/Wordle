//
//  FooterView.swift
//  Wordle
//
//  Created by mpc on 6/3/22.
//

import UIKit

class FooterView: UICollectionReusableView {
    static let identifier = "FooterIdentifier"

    var keyboardView: KeyboardView = {
        let view = KeyboardView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public func configure() {
        addSubview(keyboardView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        keyboardView.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: nil, paddingTop: 20.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 200.0)
    }
}
