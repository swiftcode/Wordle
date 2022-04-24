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

//TODO: Phase this out and replace with GuessValue
enum BoxColor {
    case initial
    case correct
    case semicorrect
    case incorrect

    init() {
        self = .initial
    }
}

enum GuessValue {
    case initial
    case correct
    case semicorrect
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
        font = UIFont.preferredFont(forTextStyle: .largeTitle)
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
            case .correct, .semicorrect, .incorrect:
                self.textColor = .white
            default:
                self.textColor = .black
        }
    }

    func setBackgroundColor(to guess: GuessValue) {

        switch guess {
            case .correct:
                backgroundColor = UIColor(named: "wordleGreen")
                self.setFontColor(to: .correct)
            case .semicorrect:
                backgroundColor = UIColor(named: "wordleYellow")
                setFontColor(to: .semicorrect)
            case .incorrect:
                backgroundColor = UIColor(named: "wordleGrey")
                setFontColor(to: .incorrect)
            default:
                setFontColor(to: .initial)
        }
    }

    func setGuess(to guess: GuessValue) {
        switch guess {
            case .correct:
                setBackgroundColor(to: .correct)
                setFontColor(to: .correct)
            case .semicorrect:
                setBackgroundColor(to: .semicorrect)
                setFontColor(to: .semicorrect)
            case .incorrect:
                setBackgroundColor(to: .incorrect)
                setFontColor(to: .incorrect)
            default:
                setBackgroundColor(to: .initial)
                setFontColor(to: .initial)
        }
    }

    func animateFlip() {
        
    }
}
