//
//  KeyboardCell.swift
//  Keyboard
//
//  Created by mpc on 6/5/22.
//

import UIKit

class KeyboardCell: UICollectionViewCell {
    static let identifier = "keyboardCell"

    var key: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = UIColor(named: "lightGrey")
        button.layer.cornerRadius = 12.0
        button.layer.cornerCurve = .continuous
        return button
    }()

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(key)

        key.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 0.0)
        self.key.setTitleColor(.black, for: .normal)

        key.addTarget(self, action: #selector(keyTapped(sender:)), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setSystemImage(to imageName: String) {
        key.setImage(UIImage(systemName: imageName), for: .normal)
        key.tintColor = UIColor.black
    }

    @objc func keyTapped(sender: UIButton) {
        if let label = sender.titleLabel?.text {
            print("tapped \(String(describing: label))")
        }
    }
}
