//
//  KeyboardButton.swift
//  Wordle
//
//  Created by mpc on 5/22/22.
//

import UIKit

class KeyboardButton: UIButton {

    var key: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(named: "wordleGrey")
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setFontColor(to guess: GuessValue) {
        switch guess {
            case .correct, .semicorrect, .incorrect:
                self.titleLabel?.textColor = .white
            default:
                self.titleLabel?.textColor = .black
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

    func setTitleText(to text: String) {
        setTitle(text, for: .normal)
    }

    func setButtonSystemImage(to systemImage: String) {
        setImage(UIImage(systemName: systemImage), for: .normal)
    }
}
