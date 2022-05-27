//
//  BoardViewController.swift
//  Wordle
//
//  Created by mpc on 5/18/22.
//

import UIKit

class BoardViewController: UIViewController {

    var titleView: TitleView = {
        let view = TitleView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var keyboardView: KeyboardView = {
        let view = KeyboardView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var button: KeyboardButton = {
        let b = KeyboardButton(frame: .zero)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("A", for: .normal)
        b.backgroundColor = .systemOrange
        return b
    }()

    var boardView: BoardView = {
        let view = BoardView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupView()
        setupLayout()
        setupActions()
    }


    //MARK: - Setup and Layout
    private func setupView() {
        [titleView, boardView, keyboardView].forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide

        titleView.addConstraint(topAnchor: guide.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.10)

        boardView.addConstraint(topAnchor: titleView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.40)

        keyboardView.addConstraint(topAnchor: boardView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 10.0, paddingLeft: 3.0, paddingRight: 0.0, paddingBottom: 0.0, width: 30.0, height: 30.0)
    }

    private func setupActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        print("buttonTapped")

        var guess: GuessValue

        let randomNumber = Int.random(in: 1...3)

        switch randomNumber {
            case 1: guess = .correct
            case 2: guess = .semicorrect
            case 3: guess = .incorrect
            default: guess = .initial
        }

        button.setBackgroundColor(to: guess)
    }
}
