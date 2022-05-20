//
//  TitleView.swift
//  Wordle
//
//  Created by mpc on 5/3/22.
//

import UIKit

class TitleView: UIView {

    var helpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.tintColor = .black
        return button
    }()

    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wordle"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        label.textAlignment = .center
        return label
    }()

    var statisticsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chart.bar"), for: .normal)
        button.tintColor = .black
        return button
    }()

    var settingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()

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
        [helpButton, title, statisticsButton, settingsButton].forEach { addSubview($0) }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.widthAnchor.constraint(equalToConstant: Screen.width * 0.40),
            title.heightAnchor.constraint(equalToConstant: 50.0),

            helpButton.topAnchor.constraint(equalTo: topAnchor),
            helpButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            helpButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            helpButton.widthAnchor.constraint(equalToConstant: 50.0),

            settingsButton.topAnchor.constraint(equalTo: topAnchor),
            settingsButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3.0),
            settingsButton.widthAnchor.constraint(equalToConstant: 50.0),

            statisticsButton.topAnchor.constraint(equalTo: topAnchor),
            statisticsButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            statisticsButton.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -3),
            statisticsButton.widthAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    private func setupActions() {
        helpButton.addTarget(self, action: #selector(helpButtonTapped(sender:)), for: .touchUpInside)
        statisticsButton.addTarget(self, action: #selector(statisticsButtonTapped(sender:)), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped(sender:)), for: .touchUpInside)
    }

    //MARK: - Actions
    @objc func helpButtonTapped(sender: UIButton) {
        print("helpButtonTapped")
    }

    @objc func statisticsButtonTapped(sender: UIButton) {
        print("statisticsButtonTapped")
    }

    @objc func settingsButtonTapped(sender: UIButton) {
        print("settingsButtonTapped")
    }
}
