//
//  ViewController.swift
//  Wordle
//
//  Created by mpc on 4/18/22.
//

import UIKit

class ViewController: UIViewController {

    var box: Box = {
        let textView = Box()
        textView.text = "A"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()
        setupLayout()
        setupActions()

        box.setBackgroundColor(to: .initial)
    }

    //MARK: - Setup and Layout
    private func setupView() {
        view.addSubview(box)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            box.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            box.widthAnchor.constraint(equalToConstant: 60.0),
            box.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }

    private func setupActions() {

    }
}

