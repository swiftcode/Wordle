//
//  KeyboardCell.swift
//  Wordle
//
//  Created by mpc on 5/23/22.
//

import UIKit

class KeyboardCell: UICollectionViewCell {
    static var identifier = "cell"

    var keyboard: KeyboardButton = {
        let view = KeyboardButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.setTitleColor(.black, for: .normal)
        return view
    }()

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: - Setup and Layout
    private func setupView() {
        addSubview(keyboard)
    }

    private func setupLayout() {
        keyboard.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 50.0)
    }

    //MARK: - Actions
    @objc func keyTapped() {
        print("keyTapped")
    }
}
