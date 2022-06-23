//
//  UIView.swift
//  Wordle
//
//  Created by mpc on 5/3/22.
//

import UIKit

extension UIView {
    enum ViewSide {
        case top
        case left
        case bottom
        case right
    }

    func addBorders(to sides: [ViewSide], in color: UIColor, width: CGFloat) {
        sides.forEach { addBorder(to: $0, in: color, width: width) }
    }

    func addBorder(to side: ViewSide, in color: UIColor, width: CGFloat) {
        switch side {
        case .top:
            addTopBorder(in: color, width: width)
        case .left:
            addLeftBorder(in: color, width: width)
        case .bottom:
            addBottomBorder(in: color, width: width)
        case .right:
            addRightBorder(in: color, width: width)
        }
    }

    func addTopBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        addSubview(border)
    }

    func addBottomBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        addSubview(border)
    }

    func addLeftBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }

    func addRightBorder(in color: UIColor?, width borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        addSubview(border)
    }

    func addConstraint(topAnchor: NSLayoutYAxisAnchor?,
                       leadingAnchor: NSLayoutXAxisAnchor?,
                       trailingAnchor: NSLayoutXAxisAnchor?,
                       bottomAnchor: NSLayoutYAxisAnchor?,
                       paddingTop: CGFloat,
                       paddingLeft: CGFloat,
                       paddingRight: CGFloat,
                       paddingBottom: CGFloat,
                       width: CGFloat,
                       height: CGFloat) {

        translatesAutoresizingMaskIntoConstraints = false

        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop).isActive = true
        }

        if let leadingAnchor = leadingAnchor {
            self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingLeft).isActive = true
        }

        if let trailingAnchor = trailingAnchor {
            self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: paddingRight).isActive = true
        }

        if let bottomAnchor = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: paddingBottom).isActive = true
        }

        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func addConstraint(topAnchor: NSLayoutYAxisAnchor?,
                       centerXAnchor: NSLayoutXAxisAnchor?,
                       centerYAnchor: NSLayoutYAxisAnchor?,
                       bottomAnchor: NSLayoutYAxisAnchor?,
                       paddingTop: CGFloat,
                       paddingLeft: CGFloat,
                       paddingRight: CGFloat,
                       paddingBottom: CGFloat,
                       width: CGFloat,
                       height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false

        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop).isActive = true
        }

        if let centerXAnchor = centerXAnchor {
            self.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }

        if let centerYAnchor = centerYAnchor {
            self.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }

        if let bottomAnchor = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: paddingBottom).isActive = true
        }

        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func addConstraint(topAnchor: NSLayoutYAxisAnchor?,
                       trailingAnchor: NSLayoutXAxisAnchor?,
                       centerYAnchor: NSLayoutYAxisAnchor?,
                       bottomAnchor: NSLayoutYAxisAnchor?,
                       paddingTop: CGFloat,
                       paddingLeft: CGFloat,
                       paddingRight: CGFloat,
                       paddingBottom: CGFloat,
                       width: CGFloat,
                       height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false

        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop).isActive = true
        }

        if let trailingAnchor = trailingAnchor {
            self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }

        if let centerYAnchor = centerYAnchor {
            self.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }

        if let bottomAnchor = bottomAnchor {
            self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: paddingBottom).isActive = true
        }

        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.clipsToBounds = false
    }

    func addShadow(radius: CGFloat, offset: CGSize) {
        self.addShadow()
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
    }

    func addBottomShadow() {
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height:2)
        self.layer.masksToBounds = false
    }
}
