//
//  KeyboardView.swift
//  Wordle
//
//  Created by mpc on 5/21/22.
//

import UIKit

class KeyboardView: UIView {

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: "lightGrey")
        return collection
    }()

    let topKeys = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    let middleKeys = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    let bottomKeys = ["Z","X", "C", "V", "B", "N", "M"]


    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupLayout()
        setupActions()

        print("width:-> \((Screen.width / 10.0) - 12.0)")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: - Setup and Layout
    private func setupView() {
        addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(KeyboardCell.self,
                                forCellWithReuseIdentifier: KeyboardCell.identifier)
    }

    private func setupLayout() {
        collectionView.addConstraint(topAnchor: topAnchor, leadingAnchor: leadingAnchor, trailingAnchor: trailingAnchor, bottomAnchor: bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 0.0)
    }

    private func setupActions() {

    }
}

extension KeyboardView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected \(topKeys[indexPath.row])")
    }
}

extension KeyboardView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch section {
            case 0: return topKeys.count
            case 1: return middleKeys.count
            case 2: return bottomKeys.count
            default: return 0
        }
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardCell.identifier, for: indexPath) as! KeyboardCell
        let row = indexPath.row
        
        switch indexPath.section {
            case 0: cell.keyboard.setTitle(topKeys[row], for: .normal)
            case 1: cell.keyboard.setTitle(middleKeys[row], for: .normal)
            case 2: cell.keyboard.setTitle(bottomKeys[row], for: .normal)
            default: cell.keyboard.setTitle("X", for: .normal)
        }

        return cell
    }
}

extension KeyboardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (Screen.width / 10.0) - 12.0, height: 30.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }
}