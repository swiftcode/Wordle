//
//  BoxView.swift
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

class LetterView: UITextField {

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
        adjustsFontForContentSizeCategory = true
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

    func setFontColor(to guess: GuessValue) {
        switch guess {
            case .correct, .semicorrect, .incorrect:
                self.textColor = .white
            default:
                self.textColor = .black
        }
    }

    func setBackgroundColor(to guess: GuessValue) {

        setFontColor(to: guess)

        switch guess {
            case .correct:
                backgroundColor = UIColor(named: "wordleGreen")
            case .semicorrect:
                backgroundColor = UIColor(named: "wordleYellow")
            case .incorrect:
                backgroundColor = UIColor(named: "wordleGrey")
            default:
                setFontColor(to: .initial)
        }
    }

    func setGuess(to guess: GuessValue) {
        setBackgroundColor(to: guess)
        setFontColor(to: guess)
    }

    func animateFlip() {
        var guess: GuessValue

        let randomNumber = Int.random(in: 1...3)

        switch randomNumber {
            case 1: guess = .correct
            case 2: guess = .semicorrect
            case 3: guess = .incorrect
            default: guess = .initial
        }

        UIView.transition(with: self,
                          duration: 0.4,
                          options: .transitionFlipFromBottom,
                          animations: nil,
                          completion: { _ in
                              self.setGuess(to: guess)
                           })
    }
}
