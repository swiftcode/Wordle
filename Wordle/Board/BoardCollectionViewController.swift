//
//  BoardCollectionViewController.swift
//  Wordle
//
//  Created by mpc on 5/26/22.
//

import UIKit



class BoardCollectionViewController: UICollectionViewController {

    init() {
    let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection in
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.20), heightDimension: .fractionalHeight(1.0)))

            item.contentInsets.leading = 1.0

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0)), subitems: [item])
        group.contentInsets.leading = 20.0
        group.contentInsets.trailing = 20.0

        let section = NSCollectionLayoutSection(group: group)
        return section
        }

        super.init(collectionViewLayout: layout)
        collectionView.backgroundColor = .systemMint
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(BoardCell.self,
                                      forCellWithReuseIdentifier: BoardCell.identifier)
    }


    // MARK: - Setup
    //MARK: - Setup and Layout
    private func setupView() {
        
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([


        ])
    }

    private func setupActions() {

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier, for: indexPath) as! BoardCell

        switch indexPath.row {
            case 0: cell.backgroundColor = .systemOrange
            case 1: cell.backgroundColor = .systemRed
            case 2: cell.backgroundColor = .purple
            case 3: cell.backgroundColor = .systemTeal
            case 4: cell.backgroundColor = .systemGreen
            default: cell.backgroundColor = .magenta

        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (Screen.width / 5.0), height: 50.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
      print("Perform action")
    }
     */
}
