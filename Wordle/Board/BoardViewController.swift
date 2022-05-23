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

    var button: KeyboardButton = {
        let b = KeyboardButton(frame: .zero)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Press", for: .normal)
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
        [titleView, boardView, button].forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        let guide = view.safeAreaLayoutGuide

        titleView.addConstraint(topAnchor: guide.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.10)

        boardView.addConstraint(topAnchor: titleView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.40)

        button.addConstraint(topAnchor: boardView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: nil, bottomAnchor: nil, paddingTop: 10.0, paddingLeft: 60.0, paddingRight: 0.0, paddingBottom: 0.0, width: 60.0, height: 60.0)
    }

    private func setupActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped() {
        print("buttonTapped")
        button.setBackgroundColor(to: .correct)
    }
}
