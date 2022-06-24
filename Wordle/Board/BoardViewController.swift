//
//  BoardViewController.swift
//  Wordle
//
//  Created by mpc on 5/18/22.
//

import UIKit

class BoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 25.0, bottom: 0.0, right: 25.0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 4

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    var keyboardView: KeyboardView = {
        let view = KeyboardView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupView()
        setupLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    private func setupView() {
        view.addSubview(keyboardView)
        lockRow(row: 1)
        lockRow(row: 2)
        lockRow(row: 3)
        lockRow(row: 4)
        lockRow(row: 5)
        lockRow(row: 6)
    }

    private func setupLayout() {
        collectionView.addConstraint(topAnchor: view.topAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: Screen.height * 0.70)
        keyboardView.addConstraint(topAnchor: collectionView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingRight: 0.0, paddingBottom: 0.0, width: 0.0, height: 0.0)
    }

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BoardCell.self,
                                forCellWithReuseIdentifier: BoardCell.identifier)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.identifier)
        view.addSubview(collectionView)
    }

    //MARK:- CollectionView Delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier,
                                                      for: indexPath) as! BoardCell
        cell.isUserInteractionEnabled = true
        cell.letter.addShadow()

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier,
                                                      for: indexPath) as! BoardCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        //TODO: - Conditional sizing based on device real-estate

        let itemWidth = Screen.width / 6
        let itemSize = CGSize(width: itemWidth,
                              height: itemWidth)
        return itemSize
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: HeaderView.identifier,
                for: indexPath) as! HeaderView

            header.configure()
            return header
        } else {
            return UICollectionReusableView()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: Screen.width, height: 60.0)
    }

    //MARK: - Custom methods
    func lockRow(row: Int) {
        let lowerLimit = (row * 5) - 5
        let upperLimit = (row * 5) - 1

        print("locking cells: \(lowerLimit) to \(upperLimit)")
    }

    func rowLocked(row: Int) -> Bool {
        return false
    }
}
