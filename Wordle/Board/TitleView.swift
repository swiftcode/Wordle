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
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
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
        helpButton.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: nil, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 50.0, height: 50.0)

        title.addConstraint(topAnchor: topAnchor, centerXAnchor: centerXAnchor, centerYAnchor: nil, bottomAnchor: bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: Screen.width * 0.40, height: 50.0)

        statisticsButton.addConstraint(topAnchor: topAnchor, leadingAnchor: nil, trailingAnchor: settingsButton.leadingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 50, height: 50.0)

        settingsButton.addConstraint(topAnchor: topAnchor, leadingAnchor: nil, trailingAnchor: trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 50.0, height: 50.0)

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
