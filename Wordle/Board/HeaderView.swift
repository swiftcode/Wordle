//
//  HeaderView.swift
//  Header
//
//  Created by mpc on 6/2/22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let identifier = "HeaderIdentifier"

    var titleView: TitleView = {
        let view = TitleView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public func configure() {
        addSubview(titleView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleView.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 0.0)
    }
}
