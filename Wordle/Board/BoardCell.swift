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
        addSubview(letter)
        letter.text = "A"
    }

    private func setupLayout() {
        let cellSize = (Screen.width / 5.0) - 2.0

        NSLayoutConstraint.activate([
            letter.topAnchor.constraint(equalTo: topAnchor),
            letter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.0),
            letter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2.0),
            letter.widthAnchor.constraint(equalToConstant: cellSize),
            letter.heightAnchor.constraint(equalToConstant: cellSize)
        ])
    }

    private func setupActions() {

    }
}
