//
//  CollectionViewCell.swift
//  Wordle
//
//  Created by mpc on 5/9/22.
//

import UIKit

class BoardCell: UICollectionViewCell {

    static var identifier = "cell"

    var letter: LetterView = {
        let view = LetterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()

    var locked: Bool = false

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
        addSubview(letter)
    }

    private func setupLayout() {
        letter.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 0.0)
    }

    //MARK: - Methods
    func setLock(to lockStatus: Bool) {
        locked = lockStatus
    }

    func isLocked() -> Bool {
        return locked
    }
}
