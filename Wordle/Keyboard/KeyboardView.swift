//
//  KeyboardViewController.swift
//
//  Created by mpc on 6/5/22.
//

import UIKit

class KeyboardView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 25.0, bottom: 0.0, right: 25.0)
        layout.minimumInteritemSpacing = 4

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    var stackView = UIStackView()

    let keyboardLayers = ["QWERTYUIOP", "ASDFGHJKL", "_ZXCVBNM_"]
    //let keyboardLayers = ["QWERTYUIOPASDFGHJKL_ZXCVBNM_", "ZX"]

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        collectionView.frame = bounds
    }

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(KeyboardCell.self,
                                forCellWithReuseIdentifier: KeyboardCell.identifier)

        addSubview(collectionView)
    }

    //MARK: - CollectionView Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return keyboardLayers.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyboardLayers[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardCell.identifier, for: indexPath) as! KeyboardCell

        cell.bringSubviewToFront(cell.key)
        cell.setupActions()
        
        let section = indexPath.section
        let row = indexPath.row
        let keys = keyboardLayers[section]
        let currentKey = String(Array(keys)[row])

        cell.key.setTitle(currentKey, for: .normal)

        if section == 2 {
            if row == 0 {
                cell.setSystemImage(to: "return")
            }

            if row == keyboardLayers[section].count - 1 {
                cell.setSystemImage(to: "delete.left")
            }
        }

        cell.setupActions()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        //TODO: - Conditional sizing based on device real-estate

        let itemSize = CGSize(width: 30.0,
                              height: 60.0)
        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        var left: CGFloat = 1
        var right: CGFloat = 1

        let margin: CGFloat = 30
        let size: CGFloat = (collectionView.frame.size.width - margin) / 10
        let count: CGFloat = CGFloat(collectionView.numberOfItems(inSection: section))
        let inset: CGFloat = (collectionView.frame.size.width - (size * count) - (2 * count)) / 2

        left = inset
        right = inset

        return UIEdgeInsets(top: 3.5, left: left, bottom: 3.5, right: right)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! KeyboardCell

        let section = indexPath.section
        let row = indexPath.row
        let keys = keyboardLayers[section]
        let currentKey = String(Array(keys)[row])
        print("didSelectItem: \(currentKey)")
    }
}
