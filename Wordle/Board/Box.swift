//
//  Box.swift
//  Wordle
//
//  Created by mpc on 4/18/22.
//

import UIKit

/*
 grey: 107, 113, 116
 green: 84, 160, 96
 yellow: 195, 170, 87
 */

enum BoxColor {
    case initial
    case correct
    case semiCorrect
    case incorrect

    init() {
        self = .initial
    }
}

class Box: UITextField {

    var boxColor = BoxColor()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupLayout()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - Setup and Layout
    private func setupView() {
        textColor = .black
        backgroundColor = .white
        borderStyle = .line
        textAlignment = .center
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([


        ])
    }

    private func setupActions() {

    }

    func setFontColor(to color: BoxColor) {
        switch color {
            case .correct, .semiCorrect, .incorrect:
                self.textColor = .white
            default:
                self.textColor = .black
        }
    }

    func setBackgroundColor(to color: UIColor) {
        self.backgroundColor = color

        switch color {
            case UIColor(named: "wordleGreen"):
                self.setFontColor(to: .correct)
            case UIColor(named: "wordleYellow"):
                setFontColor(to: .semiCorrect)
            case UIColor(named: "wordleGrey"):
                setFontColor(to: .incorrect)
            default:
                setFontColor(to: .initial)
        }
    }

    func animateFlip() {
        
    }
}
