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
        return label
    }()

    var statistics: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chart.bar"), for: .normal)
        button.tintColor = .black
        return button
    }()

    var settings: UIButton = {
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
        [helpButton, title, statistics, settings].forEach { addSubview($0) }
    }

    private func setupLayout() {
        helpButton.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: nil, bottomAnchor: nil, paddingTop: 6.0, paddingLeft: 10.0, paddingRight: 0.0, paddingBottom: 0.0, width: 50.0, height: 50.0)

        title.addConstraint(topAnchor: topAnchor, leadingAnchor: helpButton.trailingAnchor, trailingAnchor: nil, bottomAnchor: nil, paddingTop: 6.0, paddingLeft: 70.0, paddingRight: 0.0, paddingBottom: 0.0, width: 100.0, height: 50.0)

        statistics.addConstraint(topAnchor: topAnchor, leadingAnchor: title.trailingAnchor, trailingAnchor: nil, bottomAnchor: nil, paddingTop: 6.0, paddingLeft: 10.0, paddingRight: 0.0, paddingBottom: 0.0, width: 50, height: 50.0)

        settings.addConstraint(topAnchor: topAnchor, leadingAnchor: statistics.trailingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: nil, paddingTop: 6.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 50.0, height: 50.0)
    }

    private func setupActions() {

    }
}
