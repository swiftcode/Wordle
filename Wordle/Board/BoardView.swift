//
//  BoardView.swift
//  Wordle
//
//  Created by mpc on 4/18/22.
//

import UIKit

class BoardView: UIView {

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupLayout()
        setupActions()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: - Setup and Layout
    private func setupView() {

    }

    private func setupLayout() {
        NSLayoutConstraint.activate([


        ])
    }

    private func setupActions() {

    }

}
