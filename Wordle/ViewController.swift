//
//  ViewController.swift
//  Wordle
//
//  Created by mpc on 4/18/22.
//

import UIKit

class ViewController: UIViewController {

    var box: LetterView = {
        let textView = LetterView()
        textView.text = "A"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    var flipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Flip", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()
        setupLayout()
        setupActions()

        box.setGuess(to: .correct)
    }

    //MARK: - Setup and Layout
    private func setupView() {
        view.addSubview(box)
        view.addSubview(flipButton)
        flipButton.backgroundColor = .orange
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            box.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            box.widthAnchor.constraint(equalToConstant: 60.0),
            box.heightAnchor.constraint(equalToConstant: 60.0),

            flipButton.topAnchor.constraint(equalTo: box.bottomAnchor, constant: 50),
            flipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            flipButton.widthAnchor.constraint(equalToConstant: 100.0),
            flipButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }

    private func setupActions() {
        flipButton.addTarget(self, action: #selector(flipLetter(sender:)), for: .touchUpInside)
    }

    @objc func flipLetter(sender: UIButton) {
        box.animateFlip()
    }
}

